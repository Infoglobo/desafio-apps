//
//  ImageTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    let view: DetailImageView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(url: String, legend: String) {
        view.fill(url: url, legend: legend)
    }
    
}
