//
//  AuthorAndDateView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class AuthorAndDateView: UIView {

    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prefixLabel.text = ""
        authorLabel.text = ""
        dateLabel.text = ""
        prefixLabel.textColor = UIColor.gray()
        authorLabel.textColor = UIColor.primary()
    }
    
    func fill(author: String, date: String) {
        prefixLabel.text = !author.isEmpty ? "por" : ""
        authorLabel.text = author
        dateLabel.text = DateParser().formatDate(from: date)
    }
    
}
