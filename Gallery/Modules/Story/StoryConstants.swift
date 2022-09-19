//
//  StoryConstants.swift
//  Gallery
//
//  Created by Daniel Belokursky on 19.09.22.
//

import Foundation

class StoryConstants {
    
    static let shared = StoryConstants()
    
    private init() {}
    
    let cellWidth: CGFloat = 75.0
    let cellHeight: CGFloat = 75.0
    let minimumLineSpacing: CGFloat = 100.0
    let cellInsets = UIEdgeInsets(top: 0, left: 50.0, bottom: 0, right: 50.0)
}
