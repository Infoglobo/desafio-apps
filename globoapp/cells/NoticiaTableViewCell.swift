//
//  NoticiaTableViewCell.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var topico: UILabel!
    @IBOutlet weak var secao: UILabel!
    @IBOutlet weak var imagemNoticia: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.accessoryType = .disclosureIndicator

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        //myOutletName = myNilValue
        super.prepareForReuse()
    }
}
