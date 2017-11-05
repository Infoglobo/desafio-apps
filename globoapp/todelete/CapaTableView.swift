//
//  CapaTableView.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class CapaTableView: UITableView {

    @IBOutlet weak var secao: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imagemCapa: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setup(secao: String, titulo: String){
        self.secao.text = secao
        self.titulo.text = titulo
    }

}
