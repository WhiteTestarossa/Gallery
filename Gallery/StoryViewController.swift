//
//  StoryViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 5.09.22.
//

import UIKit

class StoryViewController: UIViewController {
    
    private let coverView = CoverView()
    
    @objc private let closeButton = CloseButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(coverView)
        self.view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30.0),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25.0),
            closeButton.widthAnchor.constraint(equalToConstant: 40.0),
            closeButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            coverView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            coverView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0),
            coverView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0)
        ])
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func closeButtonTapped(_ sender: CloseButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
