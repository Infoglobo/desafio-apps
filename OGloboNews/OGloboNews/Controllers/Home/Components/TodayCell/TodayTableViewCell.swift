//
//  TodayTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {

    let view: TodayView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill() {
        view.fill()
    }
    
}
