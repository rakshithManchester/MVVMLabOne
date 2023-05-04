//
//  MovielistViewController.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 04/05/23.
//

import UIKit

class MovielistViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let imgBaseURL = "https://image.tmdb.org/t/p/w500/"
    
    var moviesdata: MovieList? {
        didSet {
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.sharedInstance.urlRequest(urlString: "https://api.themoviedb.org/3/list/1?api_key=0e6dd54d1af0024aefdbdd5f8f422992&language=en-US") { [self] (movie: MovieList) in
            moviesdata = movie
        }
    }
}


extension MovielistViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesdata?.item_count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListTableViewCell
        cell.MovieTitle?.text = moviesdata?.items[indexPath.row].title
        if let posterUrl = moviesdata?.items[indexPath.row].poster_path, let imgUrl = URL(string: imgBaseURL + posterUrl) {
            do {
                URLSession.shared.dataTask(with: imgUrl) { _data, _response, _error in
                    guard let data = _data else {return}
                    DispatchQueue.main.async {
                        cell.posterImage?.image = UIImage(data: data)
                    }
                }.resume()
            } catch let exp {
                print(exp)
            }
        }
        return cell
    }
}

extension MovielistViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let posterUrl = moviesdata?.items[indexPath.row].poster_path, let imgUrl = URL(string: imgBaseURL + posterUrl) {
            let detailVC = DetailViewController()
            
            if let posterUrl = moviesdata?.items[indexPath.row].poster_path, let imgUrl = URL(string: imgBaseURL + posterUrl) {
                do {
                    URLSession.shared.dataTask(with: imgUrl) { _data, _response, _error in
                        guard let data = _data else {return}
                        DispatchQueue.main.async {
                            detailVC.imgData = data
                        }
                    }.resume()
                } catch let exp {
                    print(exp)
                }
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}
