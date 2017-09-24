//
//  NewsContentFilter.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

struct HomeContentDTO {
    var id = ""
    var section = ""
    var title = ""
    var image = ""
}

typealias SectionNews = (section: String, news: [HomeContentDTO])

struct NewsContentFilter {
    var news: [Content]
    
    func filterBySection() -> [SectionNews] {
        var originalNews = news
        var filteredNews = [SectionNews]()
        
        originalNews.forEach { content in
            if let section = content.section?.name {
                var newsForCurrentSection = [HomeContentDTO]()
                originalNews.filter { $0.section?.name == section }.forEach({ matchedContent in
                    newsForCurrentSection.append(getHomeDTO(from: matchedContent))
                    if let indexToRemove = originalNews.index(where: { $0.id == matchedContent.id }) {
                        originalNews.remove(at: indexToRemove)
                    }
                })
                filteredNews.append((section: section, news: newsForCurrentSection))
                if let indexToRemove = originalNews.index(where: { $0.id == content.id }) {
                    originalNews.remove(at: indexToRemove)
                }
            }
        }
        
        return filteredNews.filter { !$0.news.isEmpty }
    }
    
    private func getHomeDTO(from content: Content) -> HomeContentDTO {
        return HomeContentDTO(id: content.id,
                              section: content.section?.name ?? "",
                              title: content.title,
                              image: content.images.first?.url ?? "")
    }
    
}

