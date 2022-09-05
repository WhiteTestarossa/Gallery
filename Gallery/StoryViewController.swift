//
//  StoryViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 5.09.22.
//

import UIKit

class StoryViewController: UIViewController {
    
    private let coverView = CoverView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(coverView)
        
        NSLayoutConstraint.activate([
            coverView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            coverView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0),
            coverView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0)
        ])
    }
    
    

}
