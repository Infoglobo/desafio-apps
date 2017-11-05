//
//  NoticiaAPICallTest.swift
//  globoapp
//
//  Created by Andre Vinicius Fonseca Nogueira on 05/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import XCTest
@testable import globoapp

class NoticiaAPICallTest: XCTestCase {
    
    var noticiaAPICall: NoticiasAPICall!
    var news: [Noticia]!
    
    override func setUp() {
        super.setUp()
        let expectation = XCTestExpectation(description: "Download test")
        
        self.noticiaAPICall = NoticiasAPICall()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //        self.noticiaAPICall = NoticiaAPICall()
        noticiaAPICall.fetchNoticias { (news, error) in
            self.news = news
        }
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 10.0)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchNews() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(news)
        
        XCTAssertFalse(self.news.isEmpty)
        let size = 14
        XCTAssertEqual(self.news.count, size)
    }
    
    func testNewsAfterFetch(){
        let new: Noticia = self.news[0]
        var strTest = "Sérgio Cabral é denunciado pela sexta vez na Lava-Jato"
        XCTAssertEqual(new.title, strTest)
        strTest = "MPF denuncia doleiro Juca Bala, acusado de movimentar US$ 3 milhões para o ex-governador"
        XCTAssertEqual(new.subTitle, strTest)
        strTest = "Brasil"
        XCTAssertEqual(new.secao?.name, strTest)
        let id = new.id
        XCTAssertEqual(id, 21030945)
    }
    
    func testPos12NewsAfterFetch(){
        let new: Noticia = self.news[12]
        var strTest = "Advogado comenta novo plano de saúde popular"
        XCTAssertEqual(new.title, strTest)
        strTest = "Novo modelo pode ter coparticipação de até 50% por procedimentos"
        XCTAssertEqual(new.subTitle, strTest)
        strTest = "Defesa do Consumidor"
        XCTAssertEqual(new.secao?.name, strTest)
        let id = new.id
        XCTAssertEqual(id, 21031179)
    }
    
    func testPos13NewsAfterFetch(){
        let new: Noticia = self.news[13]
        var strTest = "Pezão sanciona lei que permite venda da Cedae"
        XCTAssertEqual(new.title, strTest)
        strTest = "Executivo poderá contratar empréstimo de até R$ 3,5 bilhões "
        XCTAssertEqual(new.subTitle, strTest)
        strTest = "Rio"
        XCTAssertEqual(new.secao?.name, strTest)
        let id = new.id
        XCTAssertEqual(id, 21030846)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
