//
//  DetailViewController.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    private let viewModel: MovieDetailsViewModel
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    convenience init() {
        self.init()
    }
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateUI() {
        posterImg.kf.indicatorType = .activity
        posterImg.kf.setImage(with: viewModel.getMoviePosterImg())
        movieName.text = viewModel.getMovieTitle()
    }
}
