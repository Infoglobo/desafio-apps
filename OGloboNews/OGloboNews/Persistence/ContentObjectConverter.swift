//
//  ContentObjectConverter.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

struct ContentObjectConverter {
    
    var entities: [Content]?
    var objects: [ContentObject]?
    
    init(entities: [Content]) {
        self.entities = entities
    }
    
    init(objects: [ContentObject]) {
        self.objects = objects
    }
    
    func convertToEntities() -> [Content] {
        guard let objects = objects else {
            return []
        }
        var convertedContent = [Content]()
        objects.forEach { object in
            var content = Content()
            content.id = object.id
            content.originalID = Int(object.id) ?? 0
            content.authors = object.authors
            content.title = object.title
            content.subTitle = object.subTitle
            content.text = object.text
            content.date = object.date
            var section = Section()
            section.name = object.sectionName
            section.url = object.sectionURL
            content.section = section
            content.type = object.type
            content.url = object.url
            var image = Image()
            image.author = object.imageAuthor
            image.source = object.imageSource
            image.legend = object.imageLegend
            image.url = object.imageURL
            content.images = [image]
            convertedContent.append(content)
        }
        return convertedContent
    }
    
    func convertToObjects() -> [ContentObject] {
        guard let entities = entities else {
            return []
        }
        var convertedObjects = [ContentObject]()
        entities.forEach { content in
            let image = content.images.filter { !$0.url.isEmpty }.first
            let object = ContentObject(id: content.id,
                                       authors: content.authors,
                                       title: content.title,
                                       subTitle: content.subTitle,
                                       text: content.text,
                                       date: content.date,
                                       sectionName: content.section?.name ?? "",
                                       sectionURL: content.section?.url ?? "",
                                       type: content.type,
                                       url: content.url,
                                       imageAuthor: image?.author ?? "",
                                       imageSource: image?.source ?? "",
                                       imageLegend: image?.legend ?? "",
                                       imageURL: image?.url ?? "")
            convertedObjects.append(object)
        }
        return convertedObjects
    }
    
}
