//
//  SubTitleTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class SubTitleTableViewCell: UITableViewCell {

    let view: SubTitleView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(subTitle: String) {
        view.fill(subTitle: subTitle)
    }
    
}
