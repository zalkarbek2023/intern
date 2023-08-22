//
//  ViewModel.swift
//  intern-2
//
//  Created by zalkarbek on 17/8/23.
//

import Foundation

class ViewModel {
    
    let networkService: NetworkService
    
     var characters: [Result] = []
    
    init() {
        self.networkService = NetworkService()
    }
    
    func fetchCharacters(complition: @escaping ([Result]) -> ()) {
        networkService.requestCharacters { characters in
            complition(characters)
        }
    }
    
}
