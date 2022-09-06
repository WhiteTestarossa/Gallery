//
//  CloseButton.swift
//  Gallery
//
//  Created by Daniel Belokursky on 6.09.22.
//

import UIKit

class CloseButton: UIControl {
    
    private let crossView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private let crossLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 2.0
        
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        
        crossView.layer.addSublayer(crossLayer)
        self.addSubview(crossView)


        NSLayoutConstraint.activate([
            crossView.widthAnchor.constraint(equalToConstant: 15.0),
            crossView.heightAnchor.constraint(equalToConstant: 15.0),
            crossView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            crossView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2

        let path1 = UIBezierPath()
        path1.move(to: crossView.bounds.origin)
        path1.addLine(to: CGPoint(x: crossView.bounds.maxX, y: crossView.bounds.maxY))

        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: crossView.bounds.maxX, y: crossView.bounds.minY))
        path2.addLine(to: CGPoint(x: crossView.bounds.minX, y: crossView.bounds.maxY))

       let combinedPath = CGMutablePath()
        combinedPath.addPath(path1.cgPath)
        combinedPath.addPath(path2.cgPath)

        crossLayer.path = combinedPath
    }
}
