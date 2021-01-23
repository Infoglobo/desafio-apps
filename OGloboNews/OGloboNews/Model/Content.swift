//
//  Content.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

enum ContentType: String {
    case material = "materia"
    case externalLink = "linkExterno"
    
    init(type: String) {
        self = ContentType(rawValue: type) ?? .externalLink
    }
}

struct Content: Mappable {
    
    var originalID = 0
    var id = ""
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
        originalID <- map["id"]
        id = "\(originalID)"
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

class ContentObject: NSObject, NSCoding {
    
    var id: String
    var authors: [String]
    var title: String
    var subTitle: String
    var text: String
    var date: String
    var sectionName: String
    var sectionURL: String
    var type: String
    var url: String
    var imageAuthor: String
    var imageSource: String
    var imageLegend: String
    var imageURL: String
    
    init(content: Content) {
        id = content.id
        authors = content.authors
        title = content.title
        subTitle = content.subTitle
        text = content.text
        date = content.date
        sectionName = content.section?.name ?? ""
        sectionURL = content.section?.url ?? ""
        type = content.type
        url = content.url
        imageAuthor = content.images.first?.author ?? ""
        imageSource = content.images.first?.source ?? ""
        imageLegend = content.images.first?.legend ?? ""
        imageURL = content.images.first?.url ?? ""
    }
    
    init(id: String, authors: [String], title: String, subTitle: String, text: String, date: String, sectionName: String, sectionURL: String, type: String, url: String, imageAuthor: String, imageSource: String, imageLegend: String, imageURL: String) {
        self.id = id
        self.authors = authors
        self.title = title
        self.subTitle = subTitle
        self.text = text
        self.date = date
        self.sectionName = sectionName
        self.sectionURL = sectionURL
        self.type = type
        self.url = url
        self.imageAuthor = imageAuthor
        self.imageSource = imageSource
        self.imageLegend = imageLegend
        self.imageURL = imageURL
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init(id: aDecoder.decodeObject(forKey: "id") as? String ?? "",
                  authors: aDecoder.decodeObject(forKey: "authors") as? [String] ?? [],
                  title: aDecoder.decodeObject(forKey: "title") as? String ?? "",
                  subTitle: aDecoder.decodeObject(forKey: "subTitle") as? String ?? "",
                  text: aDecoder.decodeObject(forKey: "text") as? String ?? "",
                  date: aDecoder.decodeObject(forKey: "date") as? String ?? "",
                  sectionName: aDecoder.decodeObject(forKey: "sectionName") as? String ?? "",
                  sectionURL: aDecoder.decodeObject(forKey: "sectionURL") as? String ?? "",
                  type: aDecoder.decodeObject(forKey: "type") as? String ?? "",
                  url: aDecoder.decodeObject(forKey: "url") as? String ?? "",
                  imageAuthor: aDecoder.decodeObject(forKey: "imageAuthor") as? String ?? "",
                  imageSource: aDecoder.decodeObject(forKey: "imageSource") as? String ?? "",
                  imageLegend: aDecoder.decodeObject(forKey: "imageLegend") as? String ?? "",
                  imageURL: aDecoder.decodeObject(forKey: "imageURL") as? String ?? "")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(authors, forKey: "authors")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(subTitle, forKey: "subTitle")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(sectionName, forKey: "sectionName")
        aCoder.encode(sectionURL, forKey: "sectionURL")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(imageAuthor, forKey: "imageAuthor")
        aCoder.encode(imageSource, forKey: "imageSource")
        aCoder.encode(imageLegend, forKey: "imageLegend")
        aCoder.encode(imageURL, forKey: "imageURL")
    }
    
}
