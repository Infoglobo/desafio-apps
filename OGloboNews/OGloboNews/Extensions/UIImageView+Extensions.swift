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
        pin_setImage(from: URL(string: url)) { result in
            self.removeIndicatorView()
        }
    }
    
    func addIndicatorView() {
        if !subviews.contains(where: { $0.isKind(of: UIActivityIndicatorView.self) }) {
            let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            indicatorView.frame = CGRect(x: frame.size.width / 2, y: frame.size.height / 2, width: 15, height: 15)
            indicatorView.backgroundColor = .clear
            indicatorView.startAnimating()
            addSubview(indicatorView)
            bringSubview(toFront: indicatorView)
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
