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
    
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let drawingLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        // FIXME: LINES COLOR 
        layer.strokeColor = UIColor.yellow.cgColor
        layer.lineWidth = 1.0
        layer.strokeEnd = 0
        layer.strokeStart = 0
        layer.fillColor = nil
        layer.lineCap = .round
        
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
        drawingLayer.strokeColor = ColorsViewController.drawColor.cgColor
    }
    
    func drawWithTimer()  {
        //FIXME: MOVE ALL NUMBERS
        timer?.invalidate()
        timer = Timer(timeInterval: 1.0/60.0, repeats: true, block: { [self] timer in
            if (drawingLayer.strokeEnd <= 1.0) {
                drawingLayer.strokeEnd += CGFloat(1.0 / (60.0 * 3.0))
            } else {
                timer.invalidate()
            }
        })
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func drawWithoutTimer() {
        drawingLayer.strokeEnd = 1.0
    }
    
    func clear() {
        drawingLayer.strokeEnd = 0
        timer?.invalidate()
        timer = nil
    }
    
}
