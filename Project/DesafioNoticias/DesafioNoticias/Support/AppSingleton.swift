//
//  AppSingleton.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 23/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation

var sharedApplication : AppSingleton {
    return AppSingleton.shared
}

class AppSingleton {
    
    fileprivate static let shared = AppSingleton()
    
    var news : [News] = []
    
    public init(newsArray : [News]) {
        self.news = newsArray
    }
    
    init () {
        self.news = []
    }
    
    func getCountAllNews() -> Int {
        return self.news.count
    }
    
}
