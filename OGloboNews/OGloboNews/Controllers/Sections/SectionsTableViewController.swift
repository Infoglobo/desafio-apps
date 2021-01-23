//
//  SectionsTableViewController.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit
import SafariServices

class SectionsTableViewController: UITableViewController, SectionsDelegate {

    // MARK: Properties
    
    private lazy var viewModel: SectionViewModel = SectionViewModel(delegate: self)
    
    // MARK: VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        navigationItem.title = viewModel.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchSections()
    }
    
    // MARK: SectionsDelegate
    
    func fetchedSections() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func openExternalLink(with url: String) {
        if let url = URL(string: url) {
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            DispatchQueue.main.async {
                self.present(safariVC, animated: true, completion: nil)
            }
        }
    }

    // MARK: UITableViewDelegate & UITableViewDataSource

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SectionTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(section: viewModel.section(at: indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selected(at: indexPath.row)
    }
    
}
