//
//  UITableView+Extensions.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    class func createCell<T: UITableViewCell>(tableView: UITableView, indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        // swiftlint:disable force_try
        return tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
        // swiftlint:enable force_cast
        // swiftlint:enable force_try
    }
    
}
