//
//  Transporter.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

class Transporter<T> {
    var data: T!
    
    init(data: T) {
        self.data = data
    }
    
    init() {
        
    }
}
