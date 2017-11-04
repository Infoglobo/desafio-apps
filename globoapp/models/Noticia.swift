//
//  Noticia.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//
import ObjectMapper
import UIKit

class Noticia: Mappable {
    
    var atualizadoEm : String?
    var autores = [String]()
    var id = 0
    var title: String?
    var subTitle: String?
    var texto: String?
    var tipo: String?
    var url: String?
    var images = [Imagem]()
    var img: Imagem? = nil
    
    var secao: Secao?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    init() {
    }
    
    func mapping(map: Map) {
        atualizadoEm <- map["atualizadoEm"]
        autores <- map["autores"]
        id <- map["id"]
        title <- map["titulo"]
        subTitle <- map["subTitulo"]
        texto <- map["texto"]
        tipo <- map["tipo"]
        url <- map["url"]
        
        if map["imagens"] != nil{
            images <- map["imagens"]
            if  images.count > 0{
                self.img = images[0]
            }
        }
        
        secao <- map["secao"]
    }
}

