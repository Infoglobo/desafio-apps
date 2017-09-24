//
//  IndicatorLoader.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

struct IndicatorLoader {
    
    func create(for reference: UIView, style: UIActivityIndicatorViewStyle = .gray) -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: style)
        indicatorView.frame = CGRect(x: reference.frame.size.width / 2, y: reference.frame.size.height / 2, width: 15, height: 15)
        indicatorView.backgroundColor = .clear
        indicatorView.startAnimating()
        return indicatorView
    }
    
}
