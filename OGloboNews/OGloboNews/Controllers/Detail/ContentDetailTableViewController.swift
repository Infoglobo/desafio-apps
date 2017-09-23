//
//  ContentDetailTableViewController.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

class ContentDetailTableViewController: UITableViewController {
    
    // MARK: Properties
    
    @IBOutlet var shareButton: UIBarButtonItem!
    private lazy var viewModel: ContentDetailViewModel = ContentDetailViewModel()
    
    // MARK: VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.section.uppercased()
    }
    
    func prepareForNavigation(transporter: Transporter<Any>) {
        viewModel.prepareForNavigation(transporter: transporter)
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
        return viewModel.height(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.isHidden = !viewModel.shouldDisplayCell(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ContentDetailCellType(row: indexPath.row) {
        case .title:
            return titleCell(at: indexPath)
        case .subTitle:
            return subTitleCell(at: indexPath)
        case .authorAndDate:
            return authorAndDateCell(at: indexPath)
        case .image:
            return imageCell(at: indexPath)
        case .content:
            return contentCell(at: indexPath)
        }
    }
    
    // MARK: Cells
    
    private func titleCell(at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    private func subTitleCell(at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    private func authorAndDateCell(at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    private func imageCell(at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    private func contentCell(at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: Share
    
    @IBAction func shareContent(_ sender: Any) {
        guard let shareMessage = viewModel.shareMessage, let navigationController = navigationController else {
            return
        }
        let activityController = UIActivityViewController(activityItems: [shareMessage], applicationActivities: nil)
        let loader = IndicatorLoader().create(for: navigationController.navigationBar)
        DispatchQueue.main.async {
            navigationController.navigationBar.addSubview(loader)
            self.title = ""
            self.present(activityController, animated: true, completion: {
                loader.removeFromSuperview()
                self.title = self.viewModel.section.uppercased()
            })
        }
    }
    
}
