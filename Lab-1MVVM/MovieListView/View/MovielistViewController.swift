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
        tableView.register(UINib(nibName: Constants.TableCellConstants.movieTableviewcellName.rawValue, bundle: nil), forCellReuseIdentifier: Constants.TableCellConstants.movieCellID.rawValue)
        // UINib(nibName: Constants.movieTableviewcellName, bundle: nil) convert to fatcory in enum
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.sharedInstance.urlRequest(urlString: Constants.AppConstants.movieListBaseURL.rawValue) { [self] (movieList: MovieList) in
            viewModel.movieList = movieList
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
}
extension MovielistViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList?.itemCount ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellConstants.movieCellID.rawValue, for: indexPath)
        guard let movieListcell = cell as? MovieListTableViewCell else { return UITableViewCell()}
        movieListcell.updateUI(indexPathRow: indexPath.row, viewModel: viewModel)
        return movieListcell
    }
}

extension MovielistViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: is initialising Coordinator correct ??
        let movieDetailCoordinator = MovieDetailCoordinator(navigation: self.navigationController ?? UINavigationController())
        movieDetailCoordinator.movieDetail = viewModel.movieList?.moviesDetailList[indexPath.row]
        movieDetailCoordinator.start()
    }
}

protocol DetailViewFactoryProtocol {
    func getDetailViewController(movieList: MovieDetail) -> DetailViewController
    func getDetailViewModel(movieList: MovieDetail) -> MovieDetailsViewModel
}

class DetailViewFactory : DetailViewFactoryProtocol {
    func getDetailViewController(movieList: MovieDetail) -> DetailViewController {
        let detailsViewModel = getDetailViewModel(movieList: movieList)
        return  DetailViewController(viewModel: detailsViewModel)
    }
    func getDetailViewModel(movieList: MovieDetail) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(movieList: movieList)
    }
}
