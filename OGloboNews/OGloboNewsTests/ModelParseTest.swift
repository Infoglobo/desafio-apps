//
//  ModelParseTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class ModelParseTest: XCTestCase {
    
    private var newsContent: [Content]?
    
    override func setUp() {
        super.setUp()
        
        MockNewsContentRequest().fetchNewsContent { news, error in
            XCTAssertNotNil(news)
            XCTAssertNil(error)
            self.newsContent = news
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNewsContentParse() {
        guard let news = newsContent else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(news.count, 14)
        XCTAssertEqual(news.first?.id, 21030945)
        XCTAssertEqual(news.first?.authors.count, 1)
        XCTAssertEqual(news.first?.authors.first, "O GLOBO")
        XCTAssertEqual(news.first?.title, "Sérgio Cabral é denunciado pela sexta vez na Lava-Jato")
        XCTAssertEqual(news.first?.subTitle, "MPF denuncia doleiro Juca Bala, acusado de movimentar US$ 3 milhões para o ex-governador")
        XCTAssertEqual(news.first?.text.characters.count, 3094)
        XCTAssertEqual(news.first?.date, "2017-03-08T13:25:03-0300")
        testSectionParse(section: news.first?.section)
        XCTAssertEqual(news.first?.type, "materia")
        XCTAssertEqual(news.first?.url, "http://m.oglobo.globo.com/brasil/sergio-cabral-denunciado-pela-sexta-vez-na-lava-jato-21030945?app=1")
        testImagesParse(images: news.first?.images)
    }
    
    func testSectionParse(section: Section?) {
        guard let section = section else {
            XCTFail()
            return
        }
        XCTAssertEqual(section.name, "Brasil")
        XCTAssertEqual(section.url, "http://m.oglobo.globo.com/brasil/")
    }
    
    func testImagesParse(images: [Image]?) {
        guard let images = images, !images.isEmpty else {
            XCTFail()
            return
        }
        XCTAssertEqual(images.count, 1)
        XCTAssertEqual(images.first?.author, "Guito Moreto")
        XCTAssertEqual(images.first?.source, "Agência O Globo / 17-11-2016")
        XCTAssertEqual(images.first?.legend, "O ex-governador do Rio Sérgio Cabral ao ser preso pela Polícia Federal em novembro")
        XCTAssertEqual(images.first?.url, "https://ogimg.infoglobo.com.br/in/20620804-669-05e/FT1086A/cabral-preso.jpg")
    }
    
}
