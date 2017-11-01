//
//  NoticiaSegue.swift
//  globoapp
//
//  Created by Andre on 31/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaSegue: UIStoryboardSegue {
    var titulo: String?
    var subtitulo: String?
    var imagem: Data?
    var texto: String?
    
    func initSegue(titulo: String, subtitulo: String, imagem: Data, texto : String){
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.imagem = imagem
        self.texto = texto
    }
    
    override func perform() {
        let fromVC = self.source as! CapaTableViewController
        let toVC = self.destination as! NoticiaViewController

        fromVC.present(toVC, animated: true, completion: nil)
    }
}
