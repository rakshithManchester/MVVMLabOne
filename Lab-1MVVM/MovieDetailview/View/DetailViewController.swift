//
//  DetailViewController.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var posterImg: UIImageView!
    var imgData: Data? = nil {
        didSet {
            if let data = imgData {
                self.posterImg.image = UIImage(data: data)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
