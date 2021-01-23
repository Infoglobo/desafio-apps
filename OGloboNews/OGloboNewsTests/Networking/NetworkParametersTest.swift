//
//  NetworkParametersTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class NetworkParametersTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHTTPMethods() {
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
        XCTAssertEqual(HTTPMethod.post.rawValue, "POST")
        XCTAssertEqual(HTTPMethod.put.rawValue, "PUT")
        XCTAssertEqual(HTTPMethod.delete.rawValue, "DELETE")
    }
    
    func testHTTPAction() {
        XCTAssertEqual(HTTPAction.newsContent.url, "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json")
    }
    
}
