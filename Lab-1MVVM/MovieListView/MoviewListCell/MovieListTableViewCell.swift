//
//  MovieListTableViewCell.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

final class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImage: UIImageView?
    @IBOutlet weak var MovieTitle: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
