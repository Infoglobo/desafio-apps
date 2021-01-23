//
//  SectionTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    let view: SectionView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(section: String) {
        view.fill(section: section)
    }
}
