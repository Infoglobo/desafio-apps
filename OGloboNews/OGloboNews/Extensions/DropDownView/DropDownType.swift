//
//  DropDownType.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

struct DropDownAnimationDTO {
    var visibleTime: TimeInterval
    var animationDuration: TimeInterval
    var animationDelay: TimeInterval
    var springDamping: CGFloat
    var springVelocity: CGFloat
    var alertHeight: CGFloat
}

enum DropDownType {
    case connectionError
    case addedFavorite
    case removedFavorite
    
    var message: String {
        switch self {
        case .connectionError:
            return "conexão à internet indisponível"
        case .addedFavorite:
            return "adicionado à lista de leitura"
        case .removedFavorite:
            return "removido da lista de leitura"
        }
    }
    
    var color: UIColor {
        switch self {
        case .connectionError:
            return UIColor(red: 203/255, green: 30/255, blue: 32/255, alpha: 1.0)
        case .addedFavorite:
            return UIColor(red: 70/255, green: 150/255, blue: 80/255, alpha: 1.0)
        case .removedFavorite:
            return UIColor(red: 245/255, green: 160/255, blue: 70/255, alpha: 1.0)
        }
    }
    
    var textColor: UIColor {
        return .white
    }
    
    var image: UIImage {
        switch self {
        case .connectionError:
            return UIImage(named: "signal")!
        case .addedFavorite:
            return UIImage(named: "added")!
        case .removedFavorite:
            return UIImage(named: "removed")!
        }
    }
    
    var animationDTO: DropDownAnimationDTO {
        return DropDownAnimationDTO(visibleTime: 4.0,
                                    animationDuration: 0.8,
                                    animationDelay: 0.0,
                                    springDamping: 0.9,
                                    springVelocity: 0.2,
                                    alertHeight: 64.0)
    }
    
}
