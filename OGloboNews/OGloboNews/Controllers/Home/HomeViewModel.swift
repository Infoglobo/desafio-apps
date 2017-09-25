//
//  HomeViewModel.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

enum HomeSectionType {
    case today
    case content
    
    static let allValues = [today, content]
    
    init(section: Int) {
        self = section == 0 ? .today : .content
    }
}

// MARK: HomeDelegate

protocol HomeDelegate: class {
    func fetchedNewsContent(success: Bool)
    func fetchedCachedNewsContent()
    func openMaterial()
    func openExternalLink()
}

class HomeViewModel {
    
    // MARK: Properties
    
    private var news = [Content]()
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
        newsService?.fetchNewsContent(completion: { fetchedNews, error in
            guard let fetchedNews = fetchedNews, error == nil else {
                self.delegate?.fetchedNewsContent(success: false)
                return
            }
            self.news = fetchedNews
            self.newsBySection = NewsContentFilter(news: fetchedNews).filterBySection()
            self.delegate?.fetchedNewsContent(success: true)
            self.persister.save(content: fetchedNews, completion: { _ in })
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
        return HomeSectionType.allValues.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch HomeSectionType(section: section) {
        case .today:
            return 1
        case .content:
            return newsBySection.count
        }
    }
    
    var headerHeight: CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func footerHeight(in section: Int) -> CGFloat {
        switch HomeSectionType(section: section) {
        case .today:
            return 1.5
        case .content:
            return .leastNonzeroMagnitude
        }
    }
    
    func cellHeight(in section: Int) -> CGFloat {
        switch HomeSectionType(section: section) {
        case .today:
            return 80
        case .content:
            return 420
        }
    }
    
    func getContentDTO(at index: Int) -> SectionNews? {
        return newsBySection.object(index: index)
    }
    
    // MARK: Selected Content
    
    var selectedContent: Content?
    
    func selectedContent(with id: String) {
        if let index = news.index(where: { $0.id == id }), let content = news.object(index: index) {
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
