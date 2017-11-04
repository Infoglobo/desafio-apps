//
//  NoticiaViewModelImageItem.swift
//  globoapp
//
//  Created by Andre on 04/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaViewModelImageItem: NoticiaViewModelItem {

    var type: NoticiaViewModelItemType{
        return .Image
    }
    
    var sectionTitle: String{
        return "Imagem"
    }
    var data: Data
    var url: String
    var title: String
    var section: String
    
    init(data: Data, url: String, title: String, section: String){
        self.data = data
        self.url = url
        self.title = title
        self.section = section
    }
    
}
