//
//  CoverView.swift
//  Gallery
//
//  Created by Daniel Belokursky on 5.09.22.
//

import UIKit

class CoverView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    private let borderLayer: CAShapeLayer = {
       let layer = CAShapeLayer()
        
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 1
        
        return layer
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 48.0)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.lineBreakMode = .byClipping
        
        return label
    }()
    
    private let typeView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.black
        
        return view
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 24.0)
        label.textColor = UIColor.white
        
        return label
    }()
    
    private let gradientView = GradientView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func changeStringFormat(of str: String) -> NSAttributedString {
        var string =  NSAttributedString()
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 1.25
        
        if let font = UIFont(name: "Rockwell", size: 48) {
            string = NSAttributedString(string: str, attributes: [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.paragraphStyle: style
            ])
        }
        
       return string
    }
    
    func setImageAndTitle(withImage: UIImage, title: String, type: String) {
        imageView.image = withImage
        titleLabel.attributedText = changeStringFormat(of: title)
        typeLabel.text = type
    }
    
}

// MARK: - Setup UI

private extension CoverView {
    
    func setup()  {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(typeView)
        self.addSubview(typeLabel)
        imageView.addSubview(gradientView)
        
        gradientView.setGradient(corner: 8.0, locations: [0.5, 1])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.337),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18.0),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30.0),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30.0),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55.0),
            
            typeView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            typeView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1.0),
            
            typeLabel.leadingAnchor.constraint(equalTo: typeView.leadingAnchor, constant: 30.0),
            typeLabel.topAnchor.constraint(equalTo: typeView.topAnchor, constant: 8.0),
            typeLabel.trailingAnchor.constraint(equalTo: typeView.trailingAnchor, constant: -30.0),
            typeLabel.bottomAnchor.constraint(equalTo: typeView.bottomAnchor, constant: -3.0),
            
            gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            gradientView.topAnchor.constraint(equalTo: imageView.topAnchor),
            gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}
