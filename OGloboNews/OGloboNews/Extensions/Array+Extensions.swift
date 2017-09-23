//
//  Array+Extensions.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

extension Array {
    
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
    
}

extension Array where Iterator.Element == String {
    
    func combined() -> String {
        var combined = ""
        forEach { stringElement in
            combined += ", \(stringElement)"
        }
        return String(describing: combined.dropFirst(2))
    }
    
}
