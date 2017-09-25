//
//  NewsContentFilterTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class NewsContentFilterTest: XCTestCase {
    
    var content: [Content]?
    
    override func setUp() {
        super.setUp()
        MockNewsContentRequest().fetchNewsContent { content, error in
            self.content = content
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFilterBySection() {
        guard let content = content else {
            XCTFail()
            return
        }
        let newsSection = NewsContentFilter(news: content).filterBySection()
        XCTAssertEqual(newsSection.count, 7)
        XCTAssertEqual(newsSection.first?.section, "Brasil")
        XCTAssertEqual(newsSection.first?.news.count, 4)
        XCTAssertEqual(newsSection.first?.news.first?.id, "21030945")
        XCTAssertEqual(newsSection.first?.news.first?.title.characters.count, 54)
    }
    
    func testFilterBySectionsWithURLs() {
        guard let content = content else {
            XCTFail()
            return
        }
        let sections = NewsContentFilter(news: content).filterBySectionsWithURLs()
        XCTAssertEqual(sections.count, 7)
        XCTAssertEqual(sections.first?.section, "Blogs")
        XCTAssertEqual(sections.first?.url, "http://blogs.oglobo.globo.com/")
    }
    
}
