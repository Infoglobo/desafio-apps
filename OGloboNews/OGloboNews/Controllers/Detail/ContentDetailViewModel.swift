//
//  ContentDetailViewModel.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

protocol ContentDetailDelegate: class {
    func fetchedDetail()
}

class ContentDetailViewModel {
    
    var content: Content?
    private weak var delegate: ContentDetailDelegate?
    
    init(delegate: ContentDetailDelegate?) {
        self.delegate = delegate
    }
    
    func prepareForNavigation(transporter: Transporter<Any>) {
        if let content = transporter.data as? Content {
            self.content = content
        }
    }
    
    var shareMessage: String? {
        guard let title = content?.title, let url = content?.url else {
            return nil
        }
        var message = "Noticia O Globo:"
        message += "\n\n\(title)"
        message += "\n\n\(url)"
        return message
    }
    
}
