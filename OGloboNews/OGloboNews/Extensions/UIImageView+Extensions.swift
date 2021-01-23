//
//  UIImageView+Extensions.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit
import PINCache
import PINRemoteImage

extension UIImageView {
 
    func downloadImage(with url: String) {
        addIndicatorView()
        pin_updateWithProgress = true
        pin_setImage(from: URL(string: url)) { _ in
            self.removeIndicatorView()
        }
    }
    
    func addIndicatorView() {
        if !subviews.contains(where: { $0.isKind(of: UIActivityIndicatorView.self) }) {
            let loader = IndicatorLoader().create(for: self)
            addSubview(loader)
            bringSubview(toFront: loader)
            backgroundColor = UIColor.black.withAlphaComponent(0.05)
        }
    }
    
    func removeIndicatorView() {
        subviews.forEach { subview in
            if subview.isKind(of: UIActivityIndicatorView.self) {
                subview.removeFromSuperview()
                backgroundColor = .clear
            }
        }
    }
    
}
