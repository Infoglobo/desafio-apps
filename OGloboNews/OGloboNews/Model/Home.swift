//
//  Home.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

struct Home: Mappable {
    
    var content = [Content]()
    var product = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    init() {
    }
    
    mutating func mapping(map: Map) {
        content <- map["conteudos"]
        product <- map["produto"]
    }
}
