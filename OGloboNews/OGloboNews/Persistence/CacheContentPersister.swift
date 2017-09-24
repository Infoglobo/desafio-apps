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
           completion(ContentObjectConverter(objects: decodedContent).convertToEntities())
           return
        }
        completion([])
    }
    
    func save(content: [Content], completion: @escaping (_ success: Bool) -> Void) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: ContentObjectConverter(entities: content).convertToObjects())
        userDefaults.setValue(encodedData, forKey: persistenceKey)
        userDefaults.synchronize()
        completion(true)
    }
    
}
