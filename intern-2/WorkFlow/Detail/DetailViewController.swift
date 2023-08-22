//
//  DetailViewController.swift
//  intern-2
//
//  Created by zalkarbek on 21/8/23.
//

import UIKit

class DetailViewController: UIViewController {
    
   private lazy var detailImageView: UIImageView = {
       let view = UIImageView()
       view.layer.cornerRadius = 50 / 2
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
   
   private lazy var detaillName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 24.0)
        return label
    }()
    
    private lazy var detaillStatus: UILabel = {
         let label = UILabel()
         label.text = ""
         label.numberOfLines = 0
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .green
         label.font = UIFont(name: "Arial", size: 20.0)
         return label
     }()
    
    private lazy var detaillInfo: UILabel = {
         let label = UILabel()
         label.text = "Info"
         label.numberOfLines = 0
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .white
         label.font = UIFont(name: "Arial", size: 20.0)
         return label
     }()
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var infoSpacies: UILabel = {
        let label = UILabel()
        label.text = "Spacies:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var infoGetSpacies: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var infoType: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var infoGetType: UILabel = {
        let label = UILabel()
        label.text = "None"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var infoGender: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var infoGetGender: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var detaillOrigin: UILabel = {
         let label = UILabel()
         label.text = "Origin"
         label.numberOfLines = 0
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .white
         label.font = UIFont(name: "Arial", size: 20.0)
         return label
     }()
    
    private lazy var originView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var originViewImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var originViewImageViewAvatar: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var originEarth: UILabel = {
        let label = UILabel()
        label.text = "Earth"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var originPlanet: UILabel = {
        let label = UILabel()
        label.text = "Planet"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont(name: "Arial", size: 17.0)
        return label
    }()
    
    private lazy var detaillEpizodes: UILabel = {
         let label = UILabel()
         label.text = "Epizodes"
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .white
         label.font = UIFont(name: "Arial", size: 20.0)
         return label
     }()
    
    private lazy var pilotView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var pilotLabel: UILabel = {
        let label = UILabel()
        label.text = "Pilot"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()
    
    private lazy var pilotEpizodeAndSeason: UILabel = {
        let label = UILabel()
        label.text = "Epizode: 1 Season: 1"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont(name: "Arial", size: 20.0)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppereance()
    }
    
    func loadImgURL(item: Result) {
        detaillName.text = item.name
        detaillStatus.text = item.status.rawValue
        infoGetSpacies.text = item.species.rawValue
//        infoGetType.text = item.type
        infoGetGender.text = item.gender.rawValue
        NetworkService.shared.getImage(url: item.image) { image in
            DispatchQueue.main.async {
                self.detailImageView.image = image
            }
        }
    }
    
    private func setupAppereance() {
        view.addSubviews(detailImageView, detaillName, detaillStatus, detaillInfo, infoView, detaillOrigin, originView, detaillEpizodes, pilotView)
        infoView.addSubviews(infoSpacies, infoGetSpacies, infoType, infoGetType, infoGender, infoGetGender)
        originView.addSubviews(originViewImageView, originEarth, originPlanet)
        originViewImageView.addSubviews(originViewImageViewAvatar)
        pilotView.addSubviews(pilotLabel, pilotEpizodeAndSeason)
            
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            detailImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -550),

            detaillName.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            detaillName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            detaillName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            detaillStatus.topAnchor.constraint(equalTo: view.topAnchor, constant: 290),
            detaillStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            detaillStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            detaillInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 310),
            detaillInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            infoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoView.widthAnchor.constraint(equalToConstant: 300),
            infoView.heightAnchor.constraint(equalToConstant: 130),
            
            infoSpacies.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            infoSpacies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            infoGetSpacies.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            infoGetSpacies.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            infoType.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            infoType.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            infoGetType.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            infoGetType.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            infoGender.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            infoGender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            infoGetGender.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            infoGetGender.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            detaillOrigin.topAnchor.constraint(equalTo: view.topAnchor, constant: 495),
            detaillOrigin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            originView.topAnchor.constraint(equalTo: view.topAnchor, constant: 530),
            originView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            originView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            originView.widthAnchor.constraint(equalToConstant: 300),
            originView.heightAnchor.constraint(equalToConstant: 80),
            
            originViewImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            originViewImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            originViewImageView.widthAnchor.constraint(equalToConstant: 80),
            originViewImageView.heightAnchor.constraint(equalToConstant: 60),
            
            originViewImageViewAvatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 560),
            originViewImageViewAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57),
            
            originEarth.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            originEarth.leadingAnchor.constraint(equalTo: originViewImageViewAvatar.leadingAnchor, constant: 70),
            
            originPlanet.topAnchor.constraint(equalTo: view.topAnchor, constant: 575),
            originPlanet.leadingAnchor.constraint(equalTo: originViewImageViewAvatar.leadingAnchor, constant: 70),
            
            detaillEpizodes.topAnchor.constraint(equalTo: view.topAnchor, constant: 620),
            detaillEpizodes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            pilotView.topAnchor.constraint(equalTo: view.topAnchor, constant: 655),
            pilotView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pilotView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pilotView.widthAnchor.constraint(equalToConstant: 300),
            pilotView.heightAnchor.constraint(equalToConstant: 80),
            
            pilotLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 665),
            pilotLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            pilotEpizodeAndSeason.topAnchor.constraint(equalTo: view.topAnchor, constant: 695),
            pilotEpizodeAndSeason.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
        ])
    }

}
