//
//  HomeContentCollectionViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class HomeContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = ""
    }
    
    func fill(image: String, title: String) {
        titleLabel.text = title
        if image.isEmpty {
            imageView.image = UIImage(named: "logo")
            imageView.contentMode = .center
        } else {
            if let localImage = UIImage(named: image.normalized()) {
                imageView.image = localImage
                imageView.contentMode = .center
            } else {
                imageView.downloadImage(with: image)
                imageView.contentMode = .scaleAspectFit
            }
        }
    }
    
}
