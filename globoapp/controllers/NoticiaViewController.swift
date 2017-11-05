//
//  NoticiaViewController.swift
//  globoapp
//
//  Created by Andre on 30/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaViewController: UIViewController {

    @IBOutlet var noticiaView: NoticiaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func setUpNoticiaView(titulo: String, subtitulo: String, imagem: Data, texto : String){
        self.noticiaView.setUpNoticiaView(titulo: titulo, subtitulo: subtitulo, imagem: imagem, texto: texto)
    }

}
