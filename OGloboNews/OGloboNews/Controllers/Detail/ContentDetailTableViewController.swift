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
    
    private lazy var viewModel: ContentDetailViewModel = ContentDetailViewModel(delegate: self)
    @IBOutlet var shareButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func prepareForNavigation(transporter: Transporter<Any>) {
        viewModel.prepareForNavigation(transporter: transporter)
    }
    
    func fetchedDetail() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.content?.title
        return cell
    }
    
    @IBAction func shareContent(_ sender: Any) {
        guard let shareMessage = viewModel.shareMessage, let navBarFrame = navigationController?.navigationBar.frame else {
            return
        }
        let activityController = UIActivityViewController(activityItems: [shareMessage], applicationActivities: nil)
        
        let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicatorView.frame = CGRect(x: navBarFrame.size.width / 2, y: navBarFrame.size.height / 2, width: 15, height: 15)
        indicatorView.backgroundColor = .clear
        indicatorView.startAnimating()
        navigationController?.navigationBar.addSubview(indicatorView)
        title = ""
        
        DispatchQueue.main.async {
            self.present(activityController, animated: true, completion: {
                indicatorView.removeFromSuperview()
                self.title = "Normal"
            })
        }
    }
    
}
