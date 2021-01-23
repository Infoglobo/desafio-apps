//
//  MockNewsContentRequest.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

class MockNewsContentRequest: NewsContentService {
    
    required init() {
    }
    
    func fetchNewsContent(completion: @escaping (_ news: [Content]?, _ error: ErrorType?) -> Void) {
        // swiftlint:disable force_cast
        // swiftlint:disable force_try
        let path = Bundle.main.path(forResource: "MockNewsContent", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let jsonResult = try! JSONSerialization.jsonObject(with: data, options: []) as! [JSONDictionary]
        let result = jsonResult.flatMap { Home(map: Map(mappingType: .fromJSON, JSON: $0)) }
        completion(result.first?.content, nil)
        // swiftlint:enable force_cast
        // swiftlint:enable force_try
    }
    
}
