//
//  CacheContentPersister.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

protocol CacheContentPersistence {
    init()
    func query(completion: @escaping (_ cachedContent: [Content]) -> Void)
    func save(content: [Content], completion: @escaping (_ success: Bool) -> Void)
}

class CacheContentPersister: CacheContentPersistence {
    
    private let persistenceKey = "cacheContent"
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    required init() {
    }
    
    func query(completion: @escaping (_ cachedContent: [Content]) -> Void) {
        if let decodedData = userDefaults.object(forKey: persistenceKey) as? Data,
           let decodedContent = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as? [ContentObject] {
           completion(convert(objects: decodedContent))
           return
        }
        completion([])
    }
    
    func save(content: [Content], completion: @escaping (_ success: Bool) -> Void) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: convert(entities: content))
        userDefaults.setValue(encodedData, forKey: persistenceKey)
        userDefaults.synchronize()
        completion(true)
    }
    
    private func convert(objects: [ContentObject]) -> [Content] {
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
    
    private func convert(entities: [Content]) -> [ContentObject] {
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
