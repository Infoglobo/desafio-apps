//
//  HomeContentView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 23/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

protocol HomeContentDelegate: class {
    func didSelectContent(with id: Int)
}

class HomeContentView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private weak var delegate: HomeContentDelegate?
    private var contentDTOs = [HomeContentDTO]() {
        didSet {
            pageControl.numberOfPages = contentDTOs.count
            collectionView.reloadData()
        }
    }
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionLabel.text = ""
        collectionView.registerCell(identifier: String(describing: HomeContentCollectionViewCell.self))
    }
    
    func fill(sectionNews: SectionNews, delegate: HomeContentDelegate?) {
        sectionLabel.text = sectionNews.section
        contentDTOs = sectionNews.news
        self.delegate = delegate
    }
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource & UICollectionViewFlowLayout
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentDTOs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = lround(Double(collectionView.contentOffset.x / collectionView.frame.size.width))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeContentCollectionViewCell = UICollectionViewCell.createCell(collectionView: collectionView, indexPath: indexPath)
        if let dto = contentDTOs.object(index: indexPath.item) {
            cell.fill(image: !dto.image.isEmpty ? dto.image : sectionLabel.text ?? "",
                      title: dto.title)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? HomeContentCollectionViewCell {
            cell.imageView.pin_cancelImageDownload()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedID = contentDTOs.object(index: indexPath.item)?.id {
            delegate?.didSelectContent(with: selectedID)
        }
    }
    
}
