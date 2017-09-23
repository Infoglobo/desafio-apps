//
//  Network.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

public typealias JSONDictionary = [String: Any]

struct HTTPResponse {
    let result: Any?
    let error: ErrorType?
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum HTTPAction {
    case newsContent
    
    var url: String {
        switch self {
        case .newsContent:
            return "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json"
        }
    }
}

enum ErrorType: Error, Equatable {
    case noContent
    case notFound
    case unavailableServer
    case networkError
    case parserError
    
    static func errorFromCode(code: Int) -> ErrorType? {
        switch code {
        case 204:
            return .noContent
        case 200...299:
            return nil
        case 404:
            return .notFound
        case 503:
            return .unavailableServer
        default:
            return .networkError
        }
    }
}

class Network: NSObject, URLSessionDataDelegate, URLSessionTaskDelegate {
    
    private let method: String?
    private let actionURL: String?
    
    private var verbose: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }
    
    private let dispatchGroup = DispatchGroup()
    
    init(action: HTTPAction, method: HTTPMethod) {
        self.actionURL = action.url
        self.method = method.rawValue
    }
    
    private var request: NSMutableURLRequest? {
        guard let url = requestURL, let method = method else {
            return nil
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method
        return request
    }
    
    private var requestURL: URL? {
        if let actionURL = actionURL {
            return URL(string: actionURL)
        }
        return nil
    }
    
    func makeRequest(completion: @escaping (_ response: HTTPResponse) -> Void) {
        guard let request = request else {
            return
        }
        
        if verbose {
            debugPrint("# REQUEST")
            debugPrint("# URL: \(request.url?.absoluteString ?? "[invalid]")")
            debugPrint("# METHOD: \(request.httpMethod)")
        }
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let queue = DispatchQueue(label: "\(String(describing: Network.self).lowercased()).dispatchgroup",
            attributes: .concurrent, target: nil)
        
        dispatchGroup.enter()
        queue.async(group: dispatchGroup) {
            let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, self.verbose {
                    debugPrint("# RESPONSE")
                    debugPrint("# STATUS: \(response.statusCode)")
                    debugPrint("# DESCRIPTION: \(response.debugDescription)")
                }
                
                if let requestData = data {
                    do {
                        let deserialized = try JSONSerialization.jsonObject(with: requestData, options: [])
                        if let json =  deserialized as? JSONDictionary {
                            completion(HTTPResponse(result: json, error: nil))
                        } else if let jsonArray = deserialized as? [JSONDictionary] {
                            completion(HTTPResponse(result: jsonArray, error: nil))
                        } else {
                            completion(HTTPResponse(result: [:], error: nil))
                        }
                    } catch {
                        completion(HTTPResponse(result: [:], error: nil))
                    }
                    
                } else {
                    completion(HTTPResponse(result: nil, error: .networkError))
                }
                session.finishTasksAndInvalidate()
            })
            task.resume()
            self.dispatchGroup.leave()
        }
    }
    
}
