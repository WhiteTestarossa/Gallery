//
//  GradientView.swift
//  Gallery
//
//  Created by Daniel Belokursky on 3.09.22.
//

import UIKit

class GradientView: UIView {
    
    private var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.addSublayer(gradientLayer)
    }
    
    func setGradient(corner radius: CGFloat, locations: [NSNumber]) {
        gradientLayer.cornerRadius = radius
        gradientLayer.locations = locations
    }
}
