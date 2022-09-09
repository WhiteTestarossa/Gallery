//
//  StoryCollectionViewCell.swift
//  Gallery
//
//  Created by Daniel Belokursky on 7.09.22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    var timer: Timer?
    
    private let drawingView: UIView = {
       let view = UIView()
        // FIXME: BACKGROUND
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private let drawingLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        // FIXME: LINES COLOR AND FILL
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 1.0
        layer.strokeEnd = 0
        layer.strokeStart = 0
        layer.fillColor = nil
        
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
    
    func drawWithTimer()  {
        timer = Timer(timeInterval: 1.0 / 60.0, repeats: true, block: { [self] timer in
            if (drawingLayer.strokeEnd <= 1.0) {
                drawingLayer.strokeEnd += CGFloat(1.0 / (60.0 * 3.0))
            } else {
                timer.invalidate()
            }
        })
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func clear() {
        drawingLayer.strokeEnd = 0
        timer?.invalidate()
    }
    
}
