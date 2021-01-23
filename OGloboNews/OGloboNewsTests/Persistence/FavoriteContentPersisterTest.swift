//
//  FavoriteContentPersisterTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class FavoriteContentPersisterTest: XCTestCase {
    
    var content: [Content]?
    let persister = FavoriteContentPersister()
    
    override func setUp() {
        super.setUp()
        MockNewsContentRequest().fetchNewsContent { content, _ in
            self.content = content
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPersistence() {
        var testContent = Content()
        
        persister.query { foundedContent in
            testContent = foundedContent.first!
            XCTAssertTrue(self.persister.isFavorite(content: testContent))
        }
        
        persister.delete(content: testContent) { success in
            XCTAssertTrue(success)
            XCTAssertFalse(self.persister.isFavorite(content: testContent))
        }
        
        persister.save(content: testContent) { success in
            XCTAssertTrue(success)
            XCTAssertTrue(self.persister.isFavorite(content: testContent))
        }
        
    }
    
}
