//
//  NewsImage.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 23/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation
import Freddy

struct NewsImage {
    
    var author : String
    var source : String
    var subtitles : String
    var url : URL?
    
}

extension NewsImage : JSONDecodable {
    public init(json: JSON) throws {
        self.author = try json.getString(at: "autor")
        self.source = try json.getString(at: "fonte")
        self.subtitles = try json.getString(at: "legenda")
        
        let urlString = try json.getString(at: "url")
        self.url = URL(string: urlString)
    }
}
