//
//  NetworkManager.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 04/05/23.
//

import Foundation

final class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    func urlRequest<T>(urlString: String, completionHandler: @escaping (T)->()) {
        guard let url = URL(string: urlString) else { return }
        let urlReq = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlReq) { _data, _response , _error in
            guard let data = _data else { return }
            do {
                let movieList = try JSONDecoder().decode(MovieList.self,from: data)
                completionHandler(movieList as! T)
            } catch let exp {
                print(exp)
            }
        }.resume()
    }
}
