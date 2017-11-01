//
//  Imagem.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//
import ObjectMapper
import UIKit
import AlamofireImage

class Imagem: Mappable {
    
    var url: String?
    var autor: String?
    var fonte: String?
    var legenda: String?
    var image: NSData?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.url <- map["url"]
        self.autor <- map["autor"]
        self.fonte <- map["fonte"]
        self.legenda <- map["legenda"]
        setUpNoticiaImagem()
    }
    
    
    func setUpNoticiaImagem(){
        
        if url != nil {
            let url_img = URL(string: self.url!)
            let data = try? Data(contentsOf: url_img!)
            if data != nil{
                let image = UIImage(data: data!)
                self.image = UIImageJPEGRepresentation(image!, 0.8) as NSData!
            }
        }
        
    }
    
    
    
}

