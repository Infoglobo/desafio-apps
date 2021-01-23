//
//  FavoriteTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    let view: FavoriteView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(dto: FavoriteContentDTO) {
        view.fill(dto: dto)
    }
    
}
