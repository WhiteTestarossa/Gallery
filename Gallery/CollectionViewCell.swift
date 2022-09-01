//
//  CollectionViewCell.swift
//  Gallery
//
//  Created by Daniel Belokursky on 27.08.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        let image = UIImage("story-1")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 1.0
        imageView.clipsToBounds = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        
        return imageView
    }()
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Man's best friend"
        label.font = UIFont(name: "Rockwell", size: 16.0)
        label.textColor = UIColor.white
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Story"
        label.font = UIFont(name: "Rockwell", size: 12.0)
        label.textColor = UIColor.lightGray
        
        return label
    }()
    
    private let gradientLayer: CAGradientLayer = {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellUI()
    }
    
}


// MARK: - Setup UI

extension CollectionViewCell {
    func setupCellUI() {
        
        self.contentView.layer.cornerRadius = 18.0
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 1.0
        self.contentView.backgroundColor = UIColor.white
        
        setupImageView()
        setupLabels()
        
        gradientLayer.frame = imageView.bounds
        imageView.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    func setupImageView() {
        self.contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        ])
    }
    
    func setupLabels() {
        self.imageView.addSubview(primaryLabel)
        self.imageView.addSubview(secondaryLabel)
        
        NSLayoutConstraint.activate([
            secondaryLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10.0),
            secondaryLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15.0),
            secondaryLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13.0),
            
            primaryLabel.leadingAnchor.constraint(equalTo: secondaryLabel.leadingAnchor),
            primaryLabel.bottomAnchor.constraint(equalTo: secondaryLabel.topAnchor, constant: -3.0)
        ])
    }
}
