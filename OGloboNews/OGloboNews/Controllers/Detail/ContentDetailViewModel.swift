//
//  ContentDetailViewModel.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

class ContentDetailViewModel {
    
    // MARK: Properties
    
    private var content: Content?
    
    // MARK: Constructor
    
    init() {
    }
    
    func prepareForNavigation(transporter: Transporter<Any>) {
        if let content = transporter.data as? Content {
            self.content = content
        }
    }
    
    // MARK: UI
    
    var section: String {
        return content?.section?.name ?? ""
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return ContentDetailCellType.allValues.count
    }
    
    func height(at index: Int) -> CGFloat {
        return ContentDetailCellType(row: index).height
    }
    
    func shouldDisplayCell(at index: Int) -> Bool {
        guard let content = content else {
            return false
        }
        switch ContentDetailCellType(row: index) {
        case .title:
            return !content.title.isEmpty
        case .subTitle:
            return !content.subTitle.isEmpty
        case .authorAndDate:
            return !content.authors.isEmpty || !content.date.isEmpty
        case .image:
            return !content.images.filter { !$0.url.isEmpty }.isEmpty
        case .content:
            return !content.text.isEmpty
        }
    }
    
    var title: String {
        return content?.title ?? ""
    }
    
    var subTitle: String {
        return content?.subTitle ?? ""
    }
    
    var authorAndDate: (author: String?, date: String?) {
        return (content?.authors.combined(), content?.date)
    }
    
    var image: (url: String, legend: String)? {
        if let image = content?.images.filter ({ !$0.url.isEmpty }).first {
            if !image.legend.isEmpty && !image.source.isEmpty {
                return (image.url, "\(image.legend). Foto: \(image.source)")
            } else {
                return (image.url, "")
            }
        }
        return nil
    }
    
    var text: String {
        return content?.text ?? ""
    }
    
    // MARK: Share
    
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
