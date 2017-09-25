//
//  FavoritesTableViewController.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController, FavoritesDelegate {

    // MARK: Properties
    
    private lazy var viewModel: FavoritesViewModel = FavoritesViewModel(delegate: self)
    
    // MARK: VC life cyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchFavorites()
    }
    
    private func setupUI() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        navigationItem.title = viewModel.title
        navigationItem.customizeBackButton()
        tableView.isEditing = false
    }
    
    // MARK: FavoritesDelegate
    
    func fetchedFavorites() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func removedContent() {
        viewModel.fetchFavorites()
    }
    
    func openMaterial() {
        performSegue(withIdentifier: "contentDetailSegue", sender: nil)
    }

    // MARK: UITableViewDelegate & UITableViewDataSource

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.headerHeight
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.headerTitle
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.footerHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoriteTableViewCell = UITableViewCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(dto: viewModel.favoriteDTO(at: indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectedContent(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let removeAction = UITableViewRowAction(style: .destructive, title: "Remover") { _, indexPath in
            self.viewModel.remove(at: indexPath.row)
        }
        return [removeAction]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ContentDetailTableViewController, segue.identifier == "contentDetailSegue",
            let selectedContent = viewModel.selectedContent {
            detailVC.prepareForNavigation(transporter: Transporter(data: selectedContent))
            detailVC.hidesBottomBarWhenPushed = true
        }
    }
    
}
