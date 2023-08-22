//
//  ViewController.swift
//  intern-2
//
//  Created by zalkarbek on 17/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    private  lazy var charactersCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
         view.dataSource = self
         view.delegate = self
         view.register(
            CharactersCollectionViewCell.self,
             forCellWithReuseIdentifier:
                CharactersCollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    private var viewModel: ViewModel
    private var characters: [Result] = []
    
    init() {
        viewModel = ViewModel()
        super.init(nibName: nil, bundle: nil)
    }
     
    required init?(coder: NSCoder) {
        viewModel = ViewModel()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppereance()
        setupNavigationController()
        fetchCharacters()
    }
    
    private func setupAppereance() {
        view.addSubviews(charactersCollectionView)
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    func fetchCharacters() {
        viewModel.fetchCharacters { chars in
            self.characters = chars
            DispatchQueue.main.async {
                self.charactersCollectionView.reloadData()
            }
        }
    }


}

extension ViewController: UICollectionViewDataSource {
        
        func collectionView(
            _ collectionView: UICollectionView,
            numberOfItemsInSection section: Int
        ) -> Int {
            return characters.count
            }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CharactersCollectionViewCell.id,
                    for: indexPath) as? CharactersCollectionViewCell else { fatalError() }
            let model = characters[indexPath.row]
            cell.displayItem(item: model)
            return cell
            }
      
 
    }

extension ViewController: UICollectionViewDelegateFlowLayout {
        func collectionView (
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
                return CGSize(width: 210, height: 250)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailVC = DetailViewController()
            detailVC.loadImgURL(item: characters[indexPath.row])
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
