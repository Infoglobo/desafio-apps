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
    
    public func setUpNoticiaView(titulo: String, subtitulo: String, imagem: Data, texto : String, secao: Secao, autores: [String]){
        self.noticiaView.setUpNoticiaView(titulo: titulo, subtitulo: subtitulo, imagem: imagem, texto: texto)
        self.noticiaView.setupHeader(secao: secao)
        self.noticiaView.setupAutor(authors: autores)
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
