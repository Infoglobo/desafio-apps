//
//  NoticiaViewModelTitleItem.swift
//  globoapp
//
//  Created by Andre on 04/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaViewModelTitleItem: NoticiaViewModelItem {

    var type: NoticiaViewModelItemType{
        return .Title
    }
    
    var sectionTitle: String{
        return "Titulo"
    }
    
    var title: String
    init(title: String){
        self.title = title
    }

}
