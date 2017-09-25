//
//  Colors.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func primary() -> UIColor {
        return UIColor(red: 21/255, green: 132/255, blue: 190/255, alpha: 1.0)
    }
    
    class func gray() -> UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    }
    
    class func connectionError() -> UIColor {
        return UIColor(red: 203/255, green: 30/255, blue: 32/255, alpha: 1.0)
    }
    
    class func addedFavorite() -> UIColor {
        return UIColor(red: 70/255, green: 150/255, blue: 80/255, alpha: 1.0)
    }
    
    class func removedFavorite() -> UIColor {
        return UIColor(red: 245/255, green: 160/255, blue: 70/255, alpha: 1.0)
    }
    
}
