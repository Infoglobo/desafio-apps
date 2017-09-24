//
//  HomeTableViewController.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit
import SafariServices

class HomeTableViewController: UITableViewController, HomeDelegate, HomeContentDelegate {
    
    // MARK: Properties
    
    private lazy var viewModel: HomeViewModel = HomeViewModel(delegate: self)
    private let refresher = UIRefreshControl()
    
    // MARK: VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCachedNewsContent()
        fetchNewsContent()
    }
    
    // MARK: Service
    
    private func fetchCachedNewsContent() {
        viewModel.fetchCachedNewsContent()
    }
    
    @objc func fetchNewsContent() {
        refresher.beginRefreshing()
        viewModel.fetchNewsContent()
    }
    
    // MARK: HomeDelegate
    
    func fetchedNewsContent(success: Bool) {
        DispatchQueue.main.async {
            self.refresher.endRefreshing()
            self.tableView.reloadData()
            if !success {
                self.showDropDown(type: .connectionError)
            }
        }
    }
    
    func fetchedCachedNewsContent() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func openMaterial() {
        performSegue(withIdentifier: "contentDetailSegue", sender: nil)
    }
    
    func openExternalLink() {
        if let selectedURL = viewModel.selectedContent?.url, let url = URL(string: selectedURL) {
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            DispatchQueue.main.async {
                self.present(safariVC, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: HomeContentDelegate
    
    func didSelectContent(with id: String) {
        viewModel.selectedContent(with: id)
    }
    
    // MARK: UI Setup
    
    private func setupUI() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        title = viewModel.title
        navigationItem.customizeBackButton()
        setupRefreshControl()
    }
    
    private func setupRefreshControl() {
        tableView.addSubview(refresher)
        refresher.addTarget(self, action: #selector(HomeTableViewController.fetchNewsContent), for: .valueChanged)
    }
    
    // MARK: UITableViewDelegate & UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.headerHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.footerHeight(in: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight(in: indexPath.section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeSectionType(section: indexPath.section) {
        case .today:
            return todayCell(indexPath: indexPath)
        case .content:
            return contentCell(indexPath: indexPath)
        }
    }
    
    // MARK: Cells
    
    private func todayCell(indexPath: IndexPath) -> UITableViewCell {
        let cell: TodayTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill()
        return cell
    }
    
    private func contentCell(indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeContentTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        if let sectionNews = viewModel.getContentDTO(at: indexPath.row) {
            cell.fill(sectionNews: sectionNews, delegate: self)
        }
        return cell
    }
    
    // MARK: Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ContentDetailTableViewController, segue.identifier == "contentDetailSegue",
           let selectedContent = viewModel.selectedContent {
           detailVC.prepareForNavigation(transporter: Transporter(data: selectedContent))
        }
    }
    
}
