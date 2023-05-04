//
//  DetailViewController.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImg: UIImageView!
    var imgData: Data? = nil {
        didSet {
            self.posterImg.image = UIImage(data: imgData!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
