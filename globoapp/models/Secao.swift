//
//  Secao.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//
import ObjectMapper
import UIKit

class Secao: Mappable {
    var name: String?
    var url: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.name <- map["nome"]
        self.url <- map["url"]
    }
    

    
}
