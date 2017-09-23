//
//  ObjectParser.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import ObjectMapper

precedencegroup ExponentiativePrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator <*> :ExponentiativePrecedence

func <*> <T: Mappable>(json: [Any]?, type: T.Type) -> (object: [T]?, error: ErrorType?) {
    guard let array = json as? [JSONDictionary] else {
        return (nil, .parserError)
    }
    return (array.map { T(JSON: $0)! }, nil)
}

func <*> <T: Mappable>(json: Any?, type: T.Type) -> (object: T?, error: ErrorType?) {
    guard let json = json as? JSONDictionary else {
        return (nil, .parserError)
    }
    return (T(JSON: json), nil)
}

func <*> <T: Mappable>(json: JSONDictionary?, type: T.Type) -> (object: T?, error: ErrorType?) {
    guard let json = json else {
        return (nil, .parserError)
    }
    return (T(JSON: json), nil)
}

func <*> <T: Mappable>(json: [JSONDictionary]?, response: (type: T.Type, error: ErrorType?)) -> (object: [T]?, error: ErrorType?) {
    guard let array = json else {
        return (nil, response.error ?? .parserError)
    }
    return (array.map { T(JSON: $0)! }, nil)
}

func <*> <T: Mappable>(json: Any?, response: (type: T.Type, error: ErrorType?)) -> (object: T?, error: ErrorType?) {
    guard let json = json as? JSONDictionary else {
        return (nil, response.error ?? .parserError)
    }
    return (T(JSON: json), nil)
}

func <*> <T: Mappable>(json: JSONDictionary?, response: (type: T.Type, error: ErrorType?)) -> (object: T?, error: ErrorType?) {
    guard let json = json else {
        return (nil, response.error ?? .parserError)
    }
    return (T(JSON: json), nil)
}

