//
//  GalleryImageViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 14.09.22.
//

import UIKit

class GalleryImageViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    private let closeButton = CloseButton()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
       
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        self.view.backgroundColor = UIColor.black
    }
    
    @objc private func closeButtonTapped(_ sender: CloseButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func hideCloseButton() {
        closeButton.isHidden.toggle()
    }
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    
}

extension GalleryImageViewController {
    
    func setup() {
        self.view.addSubview(scrollView)
        self.view.addSubview(closeButton)
        scrollView.addSubview(imageView)
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        scrollView.delegate = self
    
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            closeButton.widthAnchor.constraint(equalToConstant: 40.0),
            closeButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideCloseButton))
        scrollView.addGestureRecognizer(gestureRecognizer)
        
    }
}

extension GalleryImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
