//
//  NewsSpec.swift
//  DesafioNoticiasTests
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import XCTest
@testable import DesafioNoticias

class NewsSpec: XCTestCase {
    
    var news : News!
    var news2 : News!
    
    func testingModel() {
        
        let dictionary = [
            "autores" : ["Guilherme"],
            "informePublicitario" : true,
            "subTitulo" : "subtitulo",
            "titulo" : "titulo",
            "tipo" : "noticia",
            "id" : 123
            ] as [String : Any]
        
        let sectionDict = [
            "nome" : "Brasil",
            "url" : ""
        ]
        
        news = News(dictionary: dictionary)
        
        XCTAssertTrue(news.authors == ["Guilherme"])
        XCTAssertTrue(news.ads)
        XCTAssertTrue(news.subtitle == "subtitulo")
        XCTAssertTrue(news.title == "titulo")
        XCTAssertTrue(news.type == "noticia")
        XCTAssertTrue(news.id == 123)
        
        news2 = News(authors: ["Guilherme"], ads: true, subtitle: "", text: "", updatedAt: "", id: 123, publishedAt: "", section: Section(dictionary: sectionDict), type: "", title: "titulo", url: "", originalUrl: "", images: [])
        
        XCTAssertTrue(news2.authors == ["Guilherme"])
        XCTAssertTrue(news2.ads)
        XCTAssertTrue(news2.subtitle == "")
        XCTAssertTrue(news2.title == "titulo")
        XCTAssertTrue(news2.type == "")
        XCTAssertTrue(news2.id == 123)
        
    }
    
}

