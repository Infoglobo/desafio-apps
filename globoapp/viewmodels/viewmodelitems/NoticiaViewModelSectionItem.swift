//
//  NoticiaViewModelSectionItem.swift
//  globoapp
//
//  Created by Andre on 04/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaViewModelSectionItem: NoticiaViewModelItem {

    var type: NoticiaViewModelItemType{
        return .Section
    }
    
    var sectionTitle: String{
        return "Secao"
    }
    
    var section: String
    init(section: String){
        self.section = section
    }
}
