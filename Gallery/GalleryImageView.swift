//
//  GalleryImageView.swift
//  Gallery
//
//  Created by Daniel Belokursky on 14.09.22.
//

import UIKit

class GalleryImageView: UIControl {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.cornerRadius = 8.0
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setup() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8.0
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            self.imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.366),
        ])
    }
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }
    
    func getImage() -> UIImage? {
        return imageView.image
    }
}
