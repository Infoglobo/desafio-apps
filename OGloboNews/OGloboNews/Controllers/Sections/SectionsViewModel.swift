//
//  SectionsViewModel.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

protocol SectionsDelegate {
    func fetchedSections()
    func openExternalLink(with url: String)
}

class SectionViewModel {
    
    // MARK: Properties
    
    private var sections = [SectionNewsURL]()
    private let persister = CacheContentPersister()
    private var delegate: SectionsDelegate?
    
    // MARK: Constructor
    
    init(delegate: SectionsDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: Persistence
    
    func fetchSections() {
        persister.query { content in
            self.sections = NewsContentFilter(news: content).filterBySectionsWithURLs()
            self.delegate?.fetchedSections()
        }
    }
    
    // MARK: UI
    
    var title: String {
        return "Seções".uppercased()
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return sections.count
    }
    
    func section(at index: Int) -> String {
        return sections.object(index: index)?.section ?? ""
    }
    
    func selected(at index: Int) {
        if let url = sections.object(index: index)?.url {
            delegate?.openExternalLink(with: url)
        }
    }
    
}
