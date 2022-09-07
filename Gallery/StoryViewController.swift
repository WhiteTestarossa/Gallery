//
//  StoryViewController.swift
//  Gallery
//
//  Created by Daniel Belokursky on 5.09.22.
//

import UIKit

class StoryViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        
        return view
    }()
    
    private let closeButton = CloseButton()
    
    private let coverView = CoverView()
    
    private let dividerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
 


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func closeButtonTapped(_ sender: CloseButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(scrollView.contentSize.width)
        print(scrollView.contentSize.height)
        print(scrollView.frame)
    }
    
}


extension StoryViewController {
    
    func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(closeButton)
        contentView.addSubview(coverView)
        contentView.addSubview(dividerView)
  
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 40.0),
            closeButton.heightAnchor.constraint(equalToConstant: 40.0),
            closeButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40.0)
        ])

        NSLayoutConstraint.activate([
            coverView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            coverView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            coverView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0)
        ])

        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: 40.0),
            dividerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.517),
            dividerView.heightAnchor.constraint(equalToConstant: 1.0),
            dividerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0)
        ])
    }
    
}
