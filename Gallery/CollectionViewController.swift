//
//  CollectionViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 25.08.22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        // TODO: MOVE TO SETUP
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
}

// MARK: - CollectionView UI Setup

private extension CollectionViewController {
    
    func setupCollectionView() {
        self.view.backgroundColor = UIColor.white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        // FIXME: REMOVE, ADD INSETS FOR COLLECTIONVIEW
        NSLayoutConstraint.activate([
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataObject = FillingData.data[indexPath.row]
        switch dataObject {
        case .story(let story):
            let storyVC = StoryViewController(with: story)
            storyVC.modalPresentationStyle = .fullScreen
            self.present(storyVC, animated: true, completion: nil)
        case .gallery(let gallery):
            let galleryVC = GalleryViewController(with: gallery)
            galleryVC.modalPresentationStyle = .fullScreen
            self.present(galleryVC, animated: true, completion: nil)
        }
        
    }
}

// MARK: - UICollectionViewDataSource

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            cell.fillData(FillingData.data[indexPath.row])
        }
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
// FIXME: MOVE NUMBERS TO UTILS
// FIXME: SIZE OF ITEMS? SPACING BETWEEN THEM? (TOP AND BOTTTOM SPACING)
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width * 0.43
        let height = width * 1.23
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40.0, left: 20.0, bottom: 50.0, right: 20.0)
    }
}
