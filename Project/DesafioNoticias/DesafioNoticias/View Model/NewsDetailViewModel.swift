//
//  NewsDetailViewModel.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation
import UIKit

internal struct NewsDetailViewModel {
    
    var navTitle : String
    var newsTitle : String
    var newsSubtitle : String
    var author : String
    var newsDate : String
    var newsImage : UIImage
    var imageSubtitle : String
    var newsText : String
    
    init(news : News) {
        
        self.navTitle = news.section.name
        self.newsTitle = news.title
        self.newsSubtitle = news.subtitle
        self.author = news.authors.first ?? ""
        self.newsDate = news.publishedAt
        
        self.newsText = news.text
        
        if news.images.count > 0 {
            self.newsImage = news.images[0].image ?? UIImage(contentsOfFile: "imageNotFound.jpeg") ?? UIImage()
            self.imageSubtitle = news.images.first?.subtitles ?? ""
        } else {
            self.newsImage = UIImage(contentsOfFile: "imageNotFound.jpeg") ?? UIImage()
            self.imageSubtitle = ""
        }
    }
    
    init() {
        self.navTitle = ""
        self.newsTitle = ""
        self.newsSubtitle = ""
        self.author = ""
        self.newsDate = ""
        self.newsImage = UIImage()
        self.imageSubtitle = ""
        self.newsText = ""
        self.newsText = ""
    }
    
}
