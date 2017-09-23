//
//  AuthorAndDateView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class AuthorAndDateView: UIView {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        authorLabel.text = ""
        dateLabel.text = ""
    }
    
    func fill(author: String, date: String) {
        authorLabel.text = author
        dateLabel.text = date
    }
    
}
