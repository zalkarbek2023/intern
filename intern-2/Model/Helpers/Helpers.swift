//
//  Helpers.swift
//  intern-2
//
//  Created by zalkarbek on 17/8/23.
//

import Foundation

struct ImageDownloader {
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    
    func download(complition: @escaping (Data) -> (Void)) {
        let queue = DispatchQueue(label: "async")
        var imageData: Data = Data()
        queue.async {
            do {
                imageData = try Data(
                    contentsOf: URL(string: urlString)!)
                complition(imageData)
            }
            catch {
                print("error with load image data")
            }
        }
    }
}
