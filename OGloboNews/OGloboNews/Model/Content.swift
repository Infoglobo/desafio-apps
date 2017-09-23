//
//  Content.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

struct Content: Mappable {
    
    var id = 0
    var authors = [String]()
    var title = ""
    var subTitle = ""
    var text = ""
    var date = ""
    var section: Section?
    var type = ""
    var url = ""
    var images = [Image]()
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    init() {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        authors <- map["autores"]
        title <- map["titulo"]
        subTitle <- map["subTitulo"]
        text <- map["texto"]
        date <- map["atualizadoEm"]
        section <- map["secao"]
        type <- map["tipo"]
        url <- map["url"]
        images <- map["imagens"]
    }
}
