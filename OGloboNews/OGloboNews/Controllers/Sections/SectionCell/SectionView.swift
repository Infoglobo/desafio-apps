//
//  SectionView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class SectionView: UIView {

    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionLabel.text = ""
    }
    
    func fill(section: String) {
        sectionLabel.text = section
        if let image = UIImage(named: section.normalized()) {
            imageView.image = image
            leadingConstraint.constant = 60
        } else {
            imageView.image = nil
            leadingConstraint.constant = 15
        }
    }
    
}
