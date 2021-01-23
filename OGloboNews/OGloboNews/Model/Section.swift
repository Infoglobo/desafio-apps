//
//  Section.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

struct Section: Mappable {
    
    var name = ""
    var url = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    init() {
    }
    
    mutating func mapping(map: Map) {
        name <- map["nome"]
        url <- map["url"]
    }
}
