//
//  MovielistViewController.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 04/05/23.
//

import UIKit
import Kingfisher

final class MovielistViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel : MovielistViewModel
    let factory: AppDelegateFactoryProtocol
    var navigation: UINavigationController!
    
    convenience init() {
        self.init()
    }
    init(viewModel: MovielistViewModel,factory: AppDelegateFactoryProtocol) {
        self.viewModel = viewModel
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: Constants.movieTableviewcellName, bundle: nil), forCellReuseIdentifier: Constants.movieCellID)
        // UINib(nibName: Constants.movieTableviewcellName, bundle: nil) convert to fatcory in enum
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.sharedInstance.urlRequest(urlString: Constants.movieList) { [self] (movie: MovieList) in
            viewModel.moviesdata = movie
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
}
extension MovielistViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesdata?.itemCount ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieCellID, for: indexPath) as! MovieListTableViewCell
        cell.MovieTitle?.text =  viewModel.fetchTitle(indexPath: indexPath.row)
        let imgUrl = viewModel.fetchImage(indexPath: indexPath.row)
        cell.posterImage?.kf.indicatorType = .activity
        cell.posterImage?.kf.setImage(with: imgUrl)
        return cell
    }
}

extension MovielistViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewFactory.getDetailViewController()
        if let posterUrl = viewModel.moviesdata?.items[indexPath.row].posterPath, let imgUrl = URL(string: Constants.imgBaseURL + posterUrl) {
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
        }
        //    let detailViewCon = DetailViewController()
        //    detailViewCon.imgData = viewModel?.fetchPoster(IndexPath: indexPath.row)
        //    self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

protocol DetailViewFactoryProtocol {
    static func getDetailViewController() -> DetailViewController
}

class DetailViewFactory : DetailViewFactoryProtocol {
    static func getDetailViewController() -> DetailViewController {
        return  DetailViewController()
    }
}
