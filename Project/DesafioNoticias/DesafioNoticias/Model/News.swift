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
    
    var authors : [String]
    var ads : Bool
    var subtitle : String
    var text : String
    var updatedAt : String
    var id : Int
    var publishedAt : String
    var section : Section
    var type : String
    var title : String
    var url : String
    var originalUrl : String
    var images : [NewsImage] = []
    
    init(authors : [String], ads : Bool, subtitle : String, text : String, updatedAt : String, id : Int, publishedAt : String, section : Section, type : String, title : String, url : String, originalUrl : String, images : [NewsImage]) {
        self.authors = authors
        self.ads = ads
        self.subtitle = subtitle
        self.text = text
        self.updatedAt = updatedAt
        self.id = id
        self.publishedAt = publishedAt
        self.section = section
        self.type = type
        self.title = title
        self.url = url
        self.originalUrl = originalUrl
        self.images = images
    }
    
    init(dictionary : [String:Any]) {
        self.authors = dictionary["autores"] as? [String] ?? []
        self.ads = dictionary["informePublicitario"] as?  Bool ?? false
        self.subtitle = dictionary["subTitulo"] as? String ?? ""
        self.text = dictionary["texto"] as? String ?? ""
        self.updatedAt = dictionary["atualizadoEm"] as? String ?? ""
        self.id = dictionary["id"] as! Int
        self.publishedAt = dictionary["publicadoEm"] as? String ?? ""
        self.section = Section(dictionary: dictionary["secao"] as? [String:String] ?? [:])
        self.type = dictionary["tipo"] as? String ?? ""
        self.title = dictionary["titulo"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.originalUrl = dictionary["urlOriginal"] as? String ?? ""
        
        let newsImageArray = dictionary["imagens"] as? [[String:String]] ?? []
        
        if newsImageArray.count > 0 {
            for i in 0...(newsImageArray.count - 1) {
                self.images.append(NewsImage(dictionary: newsImageArray[i]))
            }
        } else {
            self.images = []
        }
        
    }
    
}
