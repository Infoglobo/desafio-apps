//
//  DetailImageView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class DetailImageView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var legendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        legendLabel.text = ""
    }
    
    func fill(url: String, legend: String) {
        imageView.downloadImage(with: url)
        legendLabel.text = legend
    }
    
}
