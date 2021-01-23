//
//  NoticiaViewHeaderTest.swift
//  globoapp
//
//  Created by Andre Vinicius Fonseca Nogueira on 05/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import XCTest
@testable import globoapp

class NoticiaViewHeaderTest: XCTestCase {
    var noticiaViewHeader: NoticiaViewHeader!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let nib = UINib(nibName: "NoticiaViewHeader", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first
        self.noticiaViewHeader = view as! NoticiaViewHeader
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotNil() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(self.noticiaViewHeader)
    }
    
    func testSection(){
        XCTAssertNotNil(self.noticiaViewHeader.secao)
        let strTest = "test"
        self.noticiaViewHeader.secao.text = strTest
        XCTAssertEqual(self.noticiaViewHeader.secao.text, strTest)
        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.fd;lgkm;ldmlsflkgnmeowinoiwjp;ofkpovfkb,;lmvxbm x  f.kmvfx.vmsl;v,;wlmkf;opwkrpjwpitjwrpokewoprkjepwihjrwqlewqkmr;eam,;sld,g/s,gfls;,/b,fs;ksfpokp[
        }
    }
    
}
