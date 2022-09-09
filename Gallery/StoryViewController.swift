//
//  StoryViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 5.09.22.
//

import UIKit

class StoryViewController: UIViewController {
    
    var dataObject: Story
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .brown
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        
        return view
    }()
    
    private let closeButton = CloseButton()
    
    private let coverView = CoverView()
    
    private let dividerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private let textContainer: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 24)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        
        return label
    }()
    
    init(with story: Story) {
        self.dataObject = story
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        fillData()
    }
    
    @objc func closeButtonTapped(_ sender: CloseButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Setup ViewController UI

extension StoryViewController {
    
    func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(closeButton)
        contentView.addSubview(coverView)
        contentView.addSubview(dividerView)
        contentView.addSubview(collectionView)
        contentView.addSubview(textContainer)
        textContainer.addSubview(textLabel)
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 40.0),
            closeButton.heightAnchor.constraint(equalToConstant: 40.0),
            closeButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            // FIXME: CONSTANT
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40.0)
        ])
        
        NSLayoutConstraint.activate([
            coverView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            coverView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            coverView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0)
        ])
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: 40.0),
            dividerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.517),
            dividerView.heightAnchor.constraint(equalToConstant: 1.0),
            dividerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30.0),
            collectionView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 40.0),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30.0)
        ])
        
        NSLayoutConstraint.activate([
            textContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20.0),
            textContainer.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 40.0),
            textContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20.0),
            textContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: textContainer.leadingAnchor, constant: 30.0),
            textLabel.topAnchor.constraint(equalTo: textContainer.topAnchor, constant: 30.0),
            textLabel.trailingAnchor.constraint(equalTo: textContainer.trailingAnchor, constant: -40.0),
            textLabel.bottomAnchor.constraint(equalTo: textContainer.bottomAnchor, constant: -30.0)
        ])
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }
    
    func fillData() {
        coverView.setImageAndTitle(withImage: dataObject.coverImage, title: dataObject.title, type: dataObject.type)
        textLabel.text = dataObject.text
    }
}

// MARK: - UICollectionViewDelegate

extension StoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? StoryCollectionViewCell {
            cell.drawWithTimer()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? StoryCollectionViewCell {
            cell.clear()
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension StoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataObject.paths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath)
        
        if let cell = cell as? StoryCollectionViewCell {
            cell.fillData(path: dataObject.paths[indexPath.row])
        }
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension StoryViewController: UICollectionViewDelegateFlowLayout {
    // FIXME: TO UTILS
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75.0, height: 75.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50.0, bottom: 0, right: 50.0)
    }
}


