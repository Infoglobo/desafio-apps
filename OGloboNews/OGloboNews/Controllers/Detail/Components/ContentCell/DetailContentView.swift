//
//  DetailContentView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class DetailContentView: UIView {

    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.text = ""
    }
    
    func fill(text: String) {
        textView.text = text
    }
}
