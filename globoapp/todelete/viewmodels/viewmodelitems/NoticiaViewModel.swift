//
//  NoticiaViewModel.swift
//  globoapp
//
//  Created by Andre on 04/11/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaViewModel: NSObject {

    var item: NoticiaViewModelItem? = nil
    
     init(noticia: Noticia){
        super.init()
        if let data = noticia.img?.image, let url = noticia.img?.url,
            let title = noticia.title, let section = noticia.secao?.name{
            let imageItem = NoticiaViewModelImageItem(data: data as Data, url: url, title: title, section: section)
            self.item = imageItem
        }
    }
}

extension NoticiaViewModel: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item!.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
 
}

