//
//  Content.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//
import ObjectMapper
import Foundation

class Content: Mappable {
    
    var content = [Noticia]()
    var product: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        content <- map["conteudos"]
        product <- map["produto"]
    }
    

}
