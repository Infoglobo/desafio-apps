//
//  FavoriteView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 25/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

struct FavoriteContentDTO {
    var section = ""
    var title = ""
}

class FavoriteView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionLabel.text = ""
        titleLabel.text = ""
        titleLabel.textColor = UIColor.gray()
    }
    
    func fill(dto: FavoriteContentDTO) {
        sectionLabel.text = dto.section
        titleLabel.text = dto.title
        if let image = UIImage(named: dto.section.normalized()) {
            imageView.image = image
            leadingConstraint.constant = 50
        } else {
            imageView.image = nil
            leadingConstraint.constant = 15
        }
    }
    
}
