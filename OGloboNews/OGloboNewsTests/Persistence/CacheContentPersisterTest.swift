//
//  CacheContentPersisterTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class CacheContentPersisterTest: XCTestCase {
    
    var content: [Content]?
    let persister = CacheContentPersister()
    
    override func setUp() {
        super.setUp()
        persister.save(content: []) { _ in }
        MockNewsContentRequest().fetchNewsContent { content, _ in
            self.content = content
        }
    }
    
    override func tearDown() {
        super.tearDown()
        persister.save(content: []) { _ in }
    }
    
    func testPersistence() {
        guard let content = content else {
            XCTFail()
            return
        }
        
        persister.query { content in
            XCTAssertTrue(content.isEmpty)
        }
        
        persister.save(content: content) { success in
            XCTAssertTrue(success)
            self.persister.query(completion: { foundedContent in
                XCTAssertEqual(content.count, foundedContent.count)
            })
        }
    }
    
}
