//
//  NewsImageSpec.swift
//  DesafioNoticiasTests
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import XCTest
@testable import DesafioNoticias

class NewsImageSpec: XCTestCase {
    
    var newsImage : NewsImage!
    
    func testingModel() {
        
        let dictionary = [
            "autor" : "Guilherme",
            "fonte" : "O Globo",
            "legenda" : "Uma legenda",
            "url" : "github.com"
        ]
        
        newsImage = NewsImage(dictionary: dictionary)
        
        let url = URL(string: "github.com")!
        
        XCTAssertTrue(newsImage.author == "Guilherme")
        XCTAssertTrue(newsImage.source == "O Globo")
        XCTAssertTrue(newsImage.subtitles == "Uma legenda")
        XCTAssertTrue(newsImage.url == url)
        XCTAssertNil(newsImage.image)
        
    }
    
}
