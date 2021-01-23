//
//  NewsDetailViewController.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var newsTitleLabel : UILabel!
    @IBOutlet weak var newsSubtitleLabel : UILabel!
    @IBOutlet weak var newsAuthorLabel : UILabel!
    @IBOutlet weak var newsDateLabel : UILabel!
    @IBOutlet weak var newsImageView : UIImageView!
    @IBOutlet weak var newsImageSubtitleLabel : UILabel!
    @IBOutlet weak var newsTextView : UITextView!
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var contentView : UIView!
    
    // MARK: - Properties
    var selectedItem : News?
    var newsDetailViewModel : NewsDetailViewModel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedItem = self.selectedItem {
            self.newsDetailViewModel = NewsDetailViewModel(news: selectedItem)
            self.screenSetup()
            self.createGradient(frame: self.newsImageView.frame)
        }

    }
    
    // MARK: - General Methods
    
    func screenSetup() {
        self.newsTitleLabel.text = self.newsDetailViewModel.newsTitle
        self.newsSubtitleLabel.text = self.newsDetailViewModel.newsSubtitle
        self.newsAuthorLabel.text = self.newsDetailViewModel.author
        self.newsDateLabel.text = String.formatDate(string: self.newsDetailViewModel.newsDate)
        self.newsImageView.image = self.newsDetailViewModel.newsImage
        self.newsImageSubtitleLabel.text = self.newsDetailViewModel.imageSubtitle
        self.newsTextView.text = self.newsDetailViewModel.newsText
        self.title = self.newsDetailViewModel.navTitle
        self.scrollViewSetup()
    }
    
    func scrollViewSetup() {
        self.scrollView.isScrollEnabled = true
        self.scrollView.isDirectionalLockEnabled = true
        
        self.scrollView.setContentOffset(CGPoint(x: 0, y: self.contentView.frame.size.height), animated: false)
        
    }
    
    func createGradient(frame : CGRect) {
        let view = UIView(frame: frame)
        let gradient = CAGradientLayer()
        
        gradient.frame = self.newsImageView.frame
        gradient.locations = [0, 1]
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        self.newsImageView.addSubview(view)
        self.newsImageView.bringSubview(toFront: view)
    }
    
    // MARK: - Actions

}
