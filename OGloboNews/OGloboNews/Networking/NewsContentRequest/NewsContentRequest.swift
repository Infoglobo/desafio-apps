//
//  NewsContentRequest.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

class NewsContentRequest: NewsContentService {
    
    required init() {
    }
    
    func fetchNewsContent(completion: @escaping (_ news: [Content]?, _ error: ErrorType?) -> Void) {
        Network(action: .newsContent, method: .get).makeRequest { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            let homeResult = response.result as? [JSONDictionary] <*> (Home.self, response.error)
            completion(homeResult.object?.first?.content, homeResult.error)
        }
    }
    
}
