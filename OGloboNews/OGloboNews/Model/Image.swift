//
//  Image.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

struct Image: Mappable {
    
    var author = ""
    var source = ""
    var legend = ""
    var url = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    init() {
    }
    
    mutating func mapping(map: Map) {
        author <- map["autor"]
        source <- map["fonte"]
        legend <- map["legenda"]
        url <- map["url"]
    }
}
