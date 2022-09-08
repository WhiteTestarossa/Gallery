//
//  StoryCollectionViewCell.swift
//  Gallery
//
//  Created by Daniel Belokursky on 7.09.22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    private let drawingView: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        
        return view
    }()
    
    private let drawingLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 1.0
        
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
    
    // FIXME: EXTENSION
    func setup() {
        self.contentView.addSubview(drawingView)
        drawingView.layer.addSublayer(drawingLayer)
        
        NSLayoutConstraint.activate([
            drawingView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            drawingView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            drawingView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            drawingView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    func fillData(path: CGPath)  {
        drawingLayer.path = path
    }
    
}
