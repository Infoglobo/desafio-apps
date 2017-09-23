//
//  ContentTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    let view: DetailContentView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(content: String) {
        view.fill(text: content)
    }
    
}
