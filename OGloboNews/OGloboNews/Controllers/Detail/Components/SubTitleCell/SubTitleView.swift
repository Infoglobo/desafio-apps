//
//  SubTitleView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class SubTitleView: UIView {

    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subTitleLabel.text = ""
    }
    
    func fill(subTitle: String) {
        subTitleLabel.text = subTitle
    }
    
}
