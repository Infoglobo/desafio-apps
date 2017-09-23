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
    private var headerView: HomeHeaderView!
    @IBOutlet weak var headerContainerView: UIView!
    
    // MARK: VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchNewsContent()
    }
    
    // MARK: Service
    
    @objc func fetchNewsContent() {
        refresher.beginRefreshing()
        viewModel.fetchNewsContent()
    }
    
    // MARK: HomeDelegate
    
    func fetchedNewsContent(success: Bool) {
        DispatchQueue.main.async {
            self.refresher.endRefreshing()
            self.headerView.fill()
            self.tableView.reloadData()
            if !success {
                // showAlert()
            }
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
    
    func didSelectContent(with id: Int) {
        viewModel.selectedContent(with: id)
    }
    
    // MARK: UI Setup
    
    private func setupUI() {
        title = viewModel.title
        navigationItem.customizeBackButton()
        setupRefreshControl()
        setupHeader()
    }
    
    private func setupRefreshControl() {
        tableView.addSubview(refresher)
        refresher.addTarget(self, action: #selector(HomeTableViewController.fetchNewsContent), for: .valueChanged)
    }
    
    private func setupHeader() {
        let view: HomeHeaderView = UIView.fromNib()
        headerContainerView.fillWithSubview(subview: view)
        headerView = view
    }
    
    // MARK: UITableViewDelegate & UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeContentTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        if let sectionNews = viewModel.getContentDTO(at: indexPath.row) {
            cell.fill(sectionNews: sectionNews, delegate: self)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ContentDetailTableViewController, segue.identifier == "contentDetailSegue",
           let selectedContent = viewModel.selectedContent {
           detailVC.prepareForNavigation(transporter: Transporter(data: selectedContent))
        }
    }
    
}
