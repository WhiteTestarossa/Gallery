//
//  GalleryViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 14.09.22.
//

import UIKit

class GalleryViewController: UIViewController {
    
    var dataObject: Gallery
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let closeButton = CloseButton()
    
    private let coverView = CoverView()
    
    private let dividerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20.0
        
        return stackView
    }()
    
    init(with data: Gallery) {
        self.dataObject = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fillData()
    }

}

extension GalleryViewController {
    
    func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(closeButton)
        contentView.addSubview(coverView)
        contentView.addSubview(dividerView)
        contentView.addSubview(stackView)
        
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
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25.0)
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
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            stackView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 40.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30.0)
        ])
    }
    
    func fillData() {
        coverView.setImageAndTitle(withImage: dataObject.coverImage, title: dataObject.title, type: dataObject.type)
        fillStackView()
    }
    
    func fillStackView() {
        for image in dataObject.images {
            let imageView = GalleryImageView()
            imageView.setImage(image: image)
            stackView.addArrangedSubview(imageView)
        }
    }
}
