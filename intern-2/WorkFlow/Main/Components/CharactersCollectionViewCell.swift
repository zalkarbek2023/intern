//
//  CharactersCollectionViewCell.swift
//  intern-2
//
//  Created by zalkarbek on 17/8/23.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    private lazy var charactersImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var charactersLabel: UILabel = {
         let label = UILabel()
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    let networkService = NetworkService.shared
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAppereance()
        backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 100 / 2
    }
    
    private func setupAppereance() {
        contentView.addSubviews(charactersImageView, charactersLabel)
        
        NSLayoutConstraint.activate([
            charactersImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            charactersImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            charactersImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            charactersImageView.widthAnchor.constraint(equalToConstant: 200),
            charactersImageView.heightAnchor.constraint(equalToConstant: 170),
        
            charactersLabel.topAnchor.constraint(equalTo: charactersImageView.bottomAnchor, constant: 20),
            charactersLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            charactersLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            
        ])
    }
    
    func displayItem(item: Result) {
        self.charactersLabel.text = item.name
        networkService.getImage(url: item.image, completion: { image in
                    DispatchQueue.main.async {
                        self.charactersImageView.image = image
                    }
            })
    }
}
