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
            return UIColor.connectionError()
        case .addedFavorite:
            return UIColor.addedFavorite()
        case .removedFavorite:
            return UIColor.removedFavorite()
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
