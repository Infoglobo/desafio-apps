//
//  NoticiasAPICall.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//
import Foundation
import ObjectMapper

class NoticiasAPICall: NSObject {
//    completion: @escaping (_ news: [Noticia]?, _ error: Error?) -> Void
    func fetchNoticias(completion: @escaping (_ news: [Noticia]?, _ error: Error?) -> Void){
        let path = Bundle.main.path(forResource: "capa", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let jsonResult = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
        let result = jsonResult.flatMap{ Content(map: Map(mappingType: .fromJSON, JSON: $0 as! [String : Any])) }
        completion(result.first?.content, nil)
    }
    
}

