//
//  NoticiaView.swift
//  globoapp
//
//  Created by Andre on 30/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit

class NoticiaView: UIView {

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subtitulo: UILabel!
    @IBOutlet weak var imagemNoticia: UIImageView!
    
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textoNoticia: UILabel!
    
    /*
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setUpNoticiaView(titulo: String, subtitulo: String, imagem: Data, texto : String ){
        self.titulo.text = titulo
        self.subtitulo.text = subtitulo
        self.imagemNoticia.image = UIImage(data: imagem as! Data)
        self.textoNoticia.text = texto
      
    }

    func setupHeader(secao: Secao){
        
        let nib = UINib(nibName: "NoticiaViewHeader", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! NoticiaViewHeader
        
        view.secao.text = secao.name
        
        self.tabBar.addSubview(view)
    }
    
    
    func setupAutor(authors: [String]){
        self.autor.text = authors[0]
    }
}
