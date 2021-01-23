//
//  AuthorAndDateTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class AuthorAndDateTableViewCell: UITableViewCell {

    let view: AuthorAndDateView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(author: String, date: String) {
        view.fill(author: author, date: date)
    }
    
}
