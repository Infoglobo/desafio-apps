//
//  FavoritesViewModel.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

protocol FavoritesDelegate: class {
    func fetchedFavorites()
    func openMaterial()
    func removedContent()
}

class FavoritesViewModel {
    
    // MARK: Properties
    
    private var content = [Content]()
    private weak var delegate: FavoritesDelegate?
    private let persister = FavoriteContentPersister()
    
    // MARK: Constructor
    
    init(delegate: FavoritesDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: Persistence
    
    func fetchFavorites() {
        persister.query { content in
            self.content = content
            self.delegate?.fetchedFavorites()
        }
    }
    
    func remove(at index: Int) {
        guard let selectedContent = content.object(index: index) else {
            return
        }
        persister.delete(content: selectedContent) { _ in
            self.delegate?.removedContent()
        }
    }
    
    // MARK: UI
    
    var title: String {
        return "Lista de Leitura".uppercased()
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return content.count
    }
    
    var headerHeight: CGFloat {
        return 50
    }
    
    var headerTitle: String {
        switch numberOfRows {
        case 0:
            return "Nenhum item salvo"
        case 1:
            return "1 item salvo"
        default:
            return "\(numberOfRows) itens salvos"
        }
    }
    
    var footerHeight: CGFloat {
        return .leastNonzeroMagnitude
    }
    
    var cellHeight: CGFloat {
        return 50
    }
    
    func favoriteDTO(at index: Int) -> FavoriteContentDTO {
        if let favorite = content.object(index: index) {
            return FavoriteContentDTO(section: favorite.section?.name ?? "", title: favorite.title)
        }
        return FavoriteContentDTO()
    }
    
    // MARK: Selected Content
    
    var selectedContent: Content?
    
    func selectedContent(at index: Int) {
        guard let selectedContent = content.object(index: index) else {
            return
        }
        self.selectedContent = selectedContent
        delegate?.openMaterial()
    }
    
}

struct FavoriteContentDTO {
    var section = ""
    var title = ""
}
