//
//  HomeViewModelTest.swift
//  OGloboNewsTests
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import XCTest
@testable import OGloboNews

class HomeViewModelTest: XCTestCase {
    
    let viewModel: HomeViewModel = HomeViewModel(delegate: nil, serviceType: MockNewsContentRequest.self)
    
    override func setUp() {
        super.setUp()
        viewModel.fetchCachedNewsContent()
        viewModel.fetchNewsContent()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHomeSectionType() {
        XCTAssertTrue(HomeSectionType(section: 0) == .today)
        XCTAssertTrue(HomeSectionType(section: 1) == .content)
        XCTAssertTrue(HomeSectionType(section: 5) == .content)
    }
    
    func testUIData() {
        XCTAssertEqual(viewModel.title, "O GLOBO")
        XCTAssertEqual(viewModel.numberOfSections, 2)
        XCTAssertEqual(viewModel.numberOfRows(in: 0), 1)
        XCTAssertEqual(viewModel.numberOfRows(in: 1), 7)
        XCTAssertEqual(viewModel.headerHeight, CGFloat.leastNonzeroMagnitude)
        XCTAssertEqual(viewModel.footerHeight(in: 0), 1.5)
        XCTAssertEqual(viewModel.footerHeight(in: 1), CGFloat.leastNonzeroMagnitude)
        XCTAssertEqual(viewModel.cellHeight(in: 0), 80)
        XCTAssertEqual(viewModel.cellHeight(in: 1), 405)
        XCTAssertEqual(viewModel.getContentDTO(at: 0)?.section, "Brasil")
        XCTAssertEqual(viewModel.getContentDTO(at: 0)?.news.count, 4)
    }
    
    func testSelectedContent() {
        let mockID = "21030945"
        XCTAssertNil(viewModel.selectedContent)
        viewModel.selectedContent(with: mockID)
        XCTAssertNotNil(viewModel.selectedContent)
        XCTAssertEqual(viewModel.selectedContent?.id, mockID)
    }
    
}
