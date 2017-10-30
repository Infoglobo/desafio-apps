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
    var image: UIImageView?
    
    required init?(map: Map) {
        mapping(map: map)
        fillImage()
    }
    
    func mapping(map: Map) {
        self.url <- map["url"]
        self.autor <- map["autor"]
        self.fonte <- map["fonte"]
        self.legenda <- map["legenda"]
    }
    
    func fillImage(){
        let serialQueue = DispatchQueue(label: "serialQueue")

        let urlRequest = URL(string: url!)!
        self.image?.af_setImage(withURL: urlRequest)
        
    }
    
    
    
}

