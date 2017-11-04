//
//  NoticiaViewModelItem.swift
//  globoapp
//
//  Created by Andre on 04/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import Foundation

protocol NoticiaViewModelItem{
    
    var type: NoticiaViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

extension NoticiaViewModelItem{
    var rowCount: Int {
        return 1
    }
}
