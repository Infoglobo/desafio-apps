//
//  NewsfeedViewModel.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 23/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation
import UIKit

internal class NewsfeedViewModel {
    
    var sectionNameText : String
    var titleText : String
    var image : UIImage
    
    init(sectionName : String, title : String, image : UIImage) {
        self.sectionNameText = sectionName
        self.titleText = title
        self.image = image
    }
    
}
