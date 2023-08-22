//
//  NetworkService.swift
//  intern-2
//
//  Created by zalkarbek on 17/8/23.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    func requestCharacters(completion: @escaping ([Result]) -> Void) {
        
        let request = URLRequest(url: Constants.API.baseURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let model = try JSONDecoder().decode(Characters.self, from: data)
                completion(model.results)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func getImage(url: String, completion: @escaping (UIImage) -> (Void)) {
            ImageDownloader(
                urlString: url
            ).download(complition: { data in
                if let image = UIImage(data: data) {
                    completion(image)
                }
            })
        }
}
