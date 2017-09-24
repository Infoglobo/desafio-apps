//
//  HomeViewModel.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

// MARK: HomeDelegate

protocol HomeDelegate: class {
    func fetchedNewsContent(success: Bool)
    func fetchedCachedNewsContent()
    func openMaterial()
    func openExternalLink()
}

class HomeViewModel {
    
    // MARK: Properties
    
    private var news: [Content]?
    private var newsBySection = [SectionNews]()
    private var newsService: NewsContentService?
    private var persister = CacheContentPersister()
    private weak var delegate: HomeDelegate?
    
    // MARK: Init
    
    init(delegate: HomeDelegate?, serviceType: NewsContentService.Type = NewsContentRequest.self) {
        self.delegate = delegate
        newsService = serviceType.init()
    }
    
    // MARK: Service
    
    func fetchNewsContent() {
        newsService?.fetchNewsContent(completion: { news, error in
            guard let news = news, error == nil else {
                self.delegate?.fetchedNewsContent(success: false)
                return
            }
            self.news = news
            self.newsBySection = NewsContentFilter(news: news).filterBySection()
            self.delegate?.fetchedNewsContent(success: true)
            self.persister.save(content: news, completion: { _ in })
        })
    }
    
    // MARK: Cache
    
    func fetchCachedNewsContent() {
        persister.query { cachedContent in
            if !cachedContent.isEmpty {
                self.news = cachedContent
                self.newsBySection = NewsContentFilter(news: cachedContent).filterBySection()
                self.delegate?.fetchedCachedNewsContent()
            }
        }
    }
    
    // MARK: UI
    
    var title: String {
        return "O Globo".uppercased()
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return newsBySection.count
    }
    
    func getContentDTO(at index: Int) -> SectionNews? {
        return newsBySection.object(index: index)
    }
    
    // MARK: Selected Content
    
    var selectedContent: Content?
    
    func selectedContent(with id: String) {
        if let index = news?.index(where: { $0.id == id }), let content = news?.object(index: index) {
            selectedContent = content
            switch ContentType(type: content.type) {
            case .material:
                delegate?.openMaterial()
            case .externalLink:
                delegate?.openExternalLink()
            }
        }
    }
    
}
