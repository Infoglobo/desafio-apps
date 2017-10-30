//
//  Imagem.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//
import ObjectMapper
import UIKit

class Imagem: Mappable {
    
    var url: String?
    var autor: String?
    var fonte: String?
    var legenda: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.url <- map["url"]
        self.autor <- map["autor"]
        self.fonte <- map["fonte"]
        self.legenda <- map["legenda"]
    }
    

    
}
