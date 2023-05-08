//
//  MovieListTableViewCell.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit
import Kingfisher

final class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImage: UIImageView?
    @IBOutlet weak var movieTitle: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(indexPathRow: Int, viewModel : MovielistViewModel) {
        movieTitle?.text =  viewModel.fetchTitle(indexPath: indexPathRow)
        let imgUrl = viewModel.fetchImage(indexPath: indexPathRow)
        posterImage?.kf.indicatorType = .activity
        posterImage?.kf.setImage(with: imgUrl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImage = nil
        self.movieTitle = nil
    }
}
