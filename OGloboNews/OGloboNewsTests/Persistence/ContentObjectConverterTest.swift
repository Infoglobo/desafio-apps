//
//  ContentObjectConverterTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class ContentObjectConverterTest: XCTestCase {
    
    var content: Content?
    
    override func setUp() {
        super.setUp()
        MockNewsContentRequest().fetchNewsContent { content, _ in
            self.content = content?.first
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConversion() {
        guard let content = content else {
            XCTFail()
            return
        }
        let object = ContentObjectConverter(entities: [content]).convertToObjects().first
        testComparision(content: content, object: object!)
        
        let entity = ContentObjectConverter(objects: [object!]).convertToEntities().first
        testComparision(content: entity!, object: object!)
    }
    
    func testComparision(content: Content, object: ContentObject) {
        XCTAssertEqual(content.id, object.id)
        XCTAssertEqual(content.authors.count, object.authors.count)
        XCTAssertEqual(content.authors.first, object.authors.first)
        XCTAssertEqual(content.title, object.title)
        XCTAssertEqual(content.subTitle, object.subTitle)
        XCTAssertEqual(content.text, object.text)
        XCTAssertEqual(content.date, object.date)
        XCTAssertEqual(content.section?.name, object.sectionName)
        XCTAssertEqual(content.section?.url, object.sectionURL)
        XCTAssertEqual(content.type, object.type)
        XCTAssertEqual(content.url, object.url)
        XCTAssertEqual(content.images.first?.author, object.imageAuthor)
        XCTAssertEqual(content.images.first?.source, object.imageSource)
        XCTAssertEqual(content.images.first?.legend, object.imageLegend)
        XCTAssertEqual(content.images.first?.url, object.imageURL)
    }
    
}
