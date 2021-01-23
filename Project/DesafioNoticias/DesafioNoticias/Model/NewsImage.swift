//
//  NewsImage.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 23/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation
import Freddy

struct NewsImage {
    
    var author : String
    var source : String
    var subtitles : String
    var url : URL?
    var image : UIImage?
    
    init(dictionary : [String : String]) {
        
        self.author = dictionary["autor"] ?? ""
        self.source = dictionary["fonte"] ?? ""
        self.subtitles = dictionary["legenda"] ?? ""
        
        let urlString = dictionary["url"] ?? ""
        self.url = URL(string: urlString)
        
    }
    
}
