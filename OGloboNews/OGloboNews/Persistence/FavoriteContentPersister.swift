//
//  FavoriteContentPersister.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

protocol FavoriteContentPersistence {
    init()
    func query(completion: @escaping (_ favorites: [Content]) -> Void)
    func isFavorite(content: Content) -> Bool
    func save(content: Content, completion: @escaping (_ success: Bool) -> Void)
    func delete(content: Content, completion: @escaping (_ success: Bool) -> Void)
}

class FavoriteContentPersister: FavoriteContentPersistence {
    
    private let persistenceKey = "favoriteContent"
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    required init() {
    }
    
    func query(completion: @escaping (_ favorites: [Content]) -> Void) {
        if let decodedData = userDefaults.object(forKey: persistenceKey) as? Data,
           let decodedFavorites = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as? [ContentObject] {
           completion(ContentObjectConverter(objects: decodedFavorites).convertToEntities())
           return
        }
        completion([])
    }
    
    func isFavorite(content: Content) -> Bool {
        var savedFavorites = [content]
        query { favorites in
            savedFavorites = favorites
        }
        return savedFavorites.contains(where: { $0.id == content.id })
    }
    
    func save(content: Content, completion: @escaping (_ success: Bool) -> Void) {
        query { favorites in
            var favoritesToSave = favorites
            favoritesToSave.append(content)
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: ContentObjectConverter(entities: favoritesToSave).convertToObjects())
            self.userDefaults.setValue(encodedData, forKey: self.persistenceKey)
            self.userDefaults.synchronize()
            completion(true)
        }
    }
    
    func delete(content: Content, completion: @escaping (_ success: Bool) -> Void) {
        query { favorites in
            var favoritesToSave = favorites
            if let indexToRemove = favoritesToSave.index(where: { $0.id == content.id }) {
                favoritesToSave.remove(at: indexToRemove)
            }
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: ContentObjectConverter(entities: favoritesToSave).convertToObjects())
            self.userDefaults.setValue(encodedData, forKey: self.persistenceKey)
            self.userDefaults.synchronize()
            completion(true)
        }
    }
    
}
