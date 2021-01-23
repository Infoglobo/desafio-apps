//
//  ContentDetailCellType.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

enum ContentDetailCellType: Int {
    case title
    case subTitle
    case authorAndDate
    case image
    case content
    
    static let allValues = [title, subTitle, authorAndDate, image, content]
    
    init(row: Int) {
        self = ContentDetailCellType(rawValue: row) ?? .title
    }
    
    var height: CGFloat {
        switch self {
        case .title, .subTitle:
            return 100
        case .authorAndDate:
            return 77
        case .image:
            return 300
        case .content:
            return 667
        }
    }
    
}
