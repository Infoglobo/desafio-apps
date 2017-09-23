//
//  TitleTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    let view: TitleView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(title: String) {
        view.fill(title: title)
    }
    
}
