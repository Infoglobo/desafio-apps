//
//  UICollectionView+Extensions.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell(identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
}

extension UICollectionViewCell {
    
    class func createCell<T: UICollectionViewCell>(collectionView: UICollectionView, indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        // swiftlint:disable force_try
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
        // swiftlint:enable force_cast
        // swiftlint:enable force_try
    }
    
}
