//
//  UITests.swift
//  DesafioNoticiasTests
//
//  Created by Guilherme Antunes on 03/11/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import UIKit
import KIF

class UITests: KIFTestCase {
    
    override func beforeAll() {
        tester().tapView(withAccessibilityLabel: "HeaderCell")
    }
    
    func testFirstCellContent() {
        let titleLabel = tester().waitForView(withAccessibilityLabel: "TitleLabel") as? UILabel
        assert(titleLabel?.text == "Sérgio Cabral é denunciado pela sexta vez na Lava-Jato")
    }
    

}

extension XCTestCase {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

extension KIFTestActor {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
