//
//  String+Extensions.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

extension String {
    
    func normalized() -> String {
        let lowerCase = lowercased()
        return lowerCase.replacingOccurrences(of: " ", with: "")
    }
    
}
