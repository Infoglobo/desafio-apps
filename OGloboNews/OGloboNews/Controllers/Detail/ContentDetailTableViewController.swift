//
//  ContentDetailTableViewController.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

class ContentDetailTableViewController: UITableViewController, ContentDetailDelegate {
    
    // MARK: Properties
    
    @IBOutlet var shareButton: UIBarButtonItem!
    @IBOutlet var saveButton: UIBarButtonItem!
    private lazy var viewModel: ContentDetailViewModel = ContentDetailViewModel(delegate: self)
    
    // MARK: VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.section.uppercased()
        saveButton.tintColor = viewModel.isFavorite ? .yellow : .white
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
        let cell: TitleTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(title: viewModel.title)
        return cell
    }
    
    private func subTitleCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell: SubTitleTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(subTitle: viewModel.subTitle)
        return cell
    }
    
    private func authorAndDateCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell: AuthorAndDateTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(author: viewModel.authorAndDate.author ?? "", date: viewModel.authorAndDate.date ?? "")
        return cell
    }
    
    private func imageCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell: ImageTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(url: viewModel.image?.url ?? "", legend: viewModel.image?.legend ?? "")
        return cell
    }
    
    private func contentCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell: ContentTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(content: viewModel.text)
        return cell
    }
    
    // MARK: Share
    
    @IBAction func shareContent() {
        guard let shareMessage = viewModel.shareMessage, let navigationController = navigationController else {
            return
        }
        let activityController = UIActivityViewController(activityItems: [shareMessage], applicationActivities: nil)
        let loader = IndicatorLoader().create(for: navigationController.navigationBar, style: .white)
        DispatchQueue.main.async {
            self.shareButton.customView = loader
            self.present(activityController, animated: true, completion: {
                self.shareButton.customView = nil
            })
        }
    }
    
    @IBAction func saveContent() {
        viewModel.saveContent()
    }
    
    // MARK: ContentDetailDelegate
    
    func favoriteFeedback(type: DropDownType) {
        DispatchQueue.main.async {
            self.showDropDown(type: type)
            self.saveButton.tintColor = type == DropDownType.addedFavorite ? .yellow : .white
        }
    }
    
}
