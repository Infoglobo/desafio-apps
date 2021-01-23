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
    
    init(news : News) {
        self.sectionNameText = news.section.name
        self.titleText = news.title
        
        if news.images.count > 0 {
            self.image = news.images[0].image ?? UIImage(contentsOfFile: "imageNotFound") ?? UIImage()
        } else {
            self.image = UIImage(contentsOfFile: "imageNotFound") ?? UIImage()
        }
        
    }
    
    init() {
        self.sectionNameText = ""
        self.titleText = ""
        self.image = UIImage()
    }
    
}
