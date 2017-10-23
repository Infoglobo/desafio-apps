//
//  News.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 23/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation
import Freddy

internal struct News {
    
    var authors : [Any]
    var ads : Bool
    var subtitle : String
    var text : String
    var videos : [Any]
    var updatedAt : String
    var id : Int
    var publishedAt : String
    var section : [String : Any]
    var type : String
    var title : String
    var url : URL?
    var originalUrl : URL?
    var images : [NewsImage]
    
}

extension News : JSONDecodable {
    public init(json: JSON) throws {
        self.authors = try json.getArray(at: "autores")
        self.ads = try json.getBool(at: "informePublicitario")
        self.subtitle = try json.getString(at: "subTitulo")
        self.text = try json.getString(at: "texto")
        self.videos = try json.getArray(at: "videos")
        self.updatedAt = try json.getString(at: "atualizadoEm")
        self.id = try json.getInt(at: "id")
        self.publishedAt = try json.getString(at: "publicadoEm")
        self.section = try json.getDictionary(at: "secao")
        self.type = try json.getString(at: "tipo")
        self.title = try json.getString(at: "titulo")
        
        let urlString = try json.getString(at: "url")
        self.url = URL(string: urlString)
        
        let originalUrlString = try json.getString(at: "urlOriginal")
        self.originalUrl = URL(string: originalUrlString)
        
        self.images = try json.getArray(at: "imagens").map(NewsImage.init)
    }
}
