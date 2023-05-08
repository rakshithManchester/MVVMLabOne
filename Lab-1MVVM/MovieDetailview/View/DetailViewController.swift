//
//  DetailViewController.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var posterImg: UIImageView!
    var posterImgStr: String! {
        didSet {
            if let imgUrl = URL(string: Constants.AppConstants.imgBaseURL.rawValue + posterImgStr) {
                do {
                    URLSession.shared.dataTask(with: imgUrl) { data, response, error in
                        guard let data = data else {return}
                        DispatchQueue.main.async { [self] in
                            posterImg.image = UIImage(data: data)
                        }
                    }.resume()
                } catch let exp {
                    print(exp)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
