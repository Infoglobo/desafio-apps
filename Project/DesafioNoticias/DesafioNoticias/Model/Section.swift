//
//  Section.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation

internal struct Section {
    
    var name : String
    var url : URL?
    
    init(dictionary : [String : String]) {
        self.name = dictionary["nome"] ?? ""
        self.url = URL(string:dictionary["url"] ?? "")
    }
}
