//
//  HomeContentTableViewCell.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class HomeContentTableViewCell: UITableViewCell {
    
    let view: HomeContentView = UIView.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillWithSubview(subview: view)
    }
    
    func fill(sectionNews: SectionNews, delegate: HomeContentDelegate?) {
        view.fill(sectionNews: sectionNews, delegate: delegate)
    }
    
}
