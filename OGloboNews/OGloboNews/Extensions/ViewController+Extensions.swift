//
//  ViewController+Extensions.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showDropDown(type: DropDownType) {
        let dropDownView: DropDownView = UIView.fromNib()
        dropDownView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: type.animationDTO.alertHeight)
        let window = UIApplication.shared.keyWindow
        window?.addSubview(dropDownView)
        window?.bringSubview(toFront: dropDownView)
        dropDownView.show(type: type)
    }
    
    func removeDropDownIfNeeded() {
        UIApplication.shared.keyWindow?.subviews.forEach { if $0.isKind(of: DropDownView.self) { $0.removeFromSuperview() } }
    }
    
}
