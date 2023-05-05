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
    var viewModel : MovielistViewModel
    
    convenience init() {
        self.init()
    }
    
    init(viewModel: MovielistViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.sharedInstance.urlRequest(urlString: "https://api.themoviedb.org/3/list/1?api_key=0e6dd54d1af0024aefdbdd5f8f422992&language=en-US") { [self] (movie: MovieList) in
            viewModel.moviesdata = movie
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
}


extension MovielistViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesdata?.item_count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListTableViewCell
        cell.MovieTitle?.text =  viewModel.fetchTitle(IndexPath: indexPath.row)
        cell.posterImage?.image = viewModel.fetchPoster(IndexPath: indexPath.row)
        return cell
    }
}

extension MovielistViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let posterUrl = viewModel.moviesdata?.items[indexPath.row].poster_path, let imgUrl = URL(string: imgBaseURL + posterUrl) {
            let detailVC = DetailViewController()
            
            if let posterUrl = viewModel.moviesdata?.items[indexPath.row].poster_path, let imgUrl = URL(string: imgBaseURL + posterUrl) {
                do {
                    URLSession.shared.dataTask(with: imgUrl) { data, response, error in
                        guard let data = data else {return}
                        DispatchQueue.main.async {
                            detailVC.imgData = data
                        }
                    }.resume()
                } catch let exp {
                    print(exp)
                }
                self.navigationController?.pushViewController(detailVC, animated: true)
//                let detailVC = DetailViewController()
//                detailVC.imgData = viewModel?.fetchPoster(IndexPath: indexPath.row)
//                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}
