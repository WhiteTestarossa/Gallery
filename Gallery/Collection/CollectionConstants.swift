//
//  Constants.swift
//  Gallery
//
//  Created by Daniel Belokursky on 17.09.22.
//

import Foundation

class CollectionConstants {
    
    static let shared = CollectionConstants()
    
    private init() {}
    
    let cellWidthRatio: CGFloat = 0.43
    let cellHeightRatio: CGFloat = 1.23
    let minimumLineSpacing: CGFloat = 30.0
    let cellInsets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 50.0, right: 20.0)
}
