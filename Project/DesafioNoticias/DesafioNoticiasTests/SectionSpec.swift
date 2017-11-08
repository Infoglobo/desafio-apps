//
//  SectionSpec.swift
//  DesafioNoticiasTests
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import XCTest
@testable import DesafioNoticias

class SectionSpec: XCTestCase {
    
    var section : Section!
    
    func testingModel() {
        let dictionary = [
            "nome" : "Noticias",
            "url" : "http://github.com"
        ]
        
        section = Section(dictionary: dictionary)
        
        let url = URL(string: "http://github.com")!
        XCTAssertTrue(section.name == "Noticias")
        XCTAssertTrue(section.url == url)
        
    }
    
}

