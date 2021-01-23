//
//  NewsfeedViewController.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 23/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

let baseURL = URL(string: "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json")!

internal class NewsfeedViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var newsTableView : UITableView!
    
    // MARK: - Properties
    
    let newsHeaderViewCellIdentifier = "headerCell"
    let newsTableViewCellIdentifier = "newsCell"
    let showNewsDetailSegue = "newsDetailSegue"
    var viewModel : [NewsfeedViewModel] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setup()
        if sharedApplication.news.count == 0 && self.viewModel.count == 0 {
            self.fetchNews()
        } else {
            self.animateTable(cells: self.newsTableView.visibleCells, tableViewHeight: self.newsTableView.bounds.height)
        }
    }
    
    // MARK: - General Methods
    
    func setup() {
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        self.newsTableView.alpha = 0
    }
    
    func createAnNewsArray(dictionaryArray : [[String:Any]]) {
        
        for i in 0...(dictionaryArray.count - 1) {
            let news = News(dictionary: dictionaryArray[i])
            sharedApplication.news.append(news)
        }
        
    }
    
    // MARK: - API Requests
    
    func fetchNews() {
        
        Alamofire.request(baseURL).response { (response) in
            
            guard let data = response.data else {
                return
            }
            
            do {
                guard let dictionaryArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String : Any]] else {
                    return
                }
                
                guard let filteredDictionary = dictionaryArray[0]["conteudos"] as? [[String:Any]] else {
                    return
                }
                
                self.createAnNewsArray(dictionaryArray: filteredDictionary)
                
                for i in 0...(sharedApplication.getCountAllNews() - 1) {
                    
                    let newsFeedModel = NewsfeedViewModel(news: sharedApplication.news[i])
                    
                    self.viewModel.append(newsFeedModel)
                }
                
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                }
                
            } catch {
                print("Error on parse!")
            }

            
            self.fetchNewsImages()
        }
    }
    
    func fetchNewsImages() {
        
        for x in 0...(sharedApplication.news.count - 1) {
            
            if sharedApplication.news[x].images.count > 0 {
                
                for y in 0...(sharedApplication.news[x].images.count - 1) {
                    Alamofire.request(sharedApplication.news[x].images[y].url ?? "").responseImage { (response) in
                        
                        if let image = response.result.value {
                            sharedApplication.news[x].images[y].image = image
                            self.viewModel[x].image = image
                        }
                        
                        DispatchQueue.main.async {
                            self.newsTableView.reloadData()
                            self.animateTable(cells: self.newsTableView.visibleCells, tableViewHeight: self.newsTableView.bounds.size.height)
                        }
                    }
                }
                
            } else {
                return
            }
        }
        
    }
    
    func animateTable(cells : [UITableViewCell], tableViewHeight : CGFloat) {
        
        self.newsTableView.alpha = 1
        var delayCounter : Double = 0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            
            UIView.animate(withDuration: 2, delay: delayCounter * 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
        
    }
}


extension NewsfeedViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedApplication.getCountAllNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCellIdentifier, for: indexPath) as! NewsTableViewCell
            
            cell.newsImageView.image = self.viewModel[indexPath.row].image
            cell.titleLabel.text = self.viewModel[indexPath.row].titleText
            cell.sectionNameLabel.text = self.viewModel[indexPath.row].sectionNameText
            
            return cell
        } else if indexPath.row == 0 {
            
            let headerCell = tableView.dequeueReusableCell(withIdentifier: self.newsHeaderViewCellIdentifier) as! NewsHeaderViewCell
            
            headerCell.newsImageView.image = self.viewModel[indexPath.row].image
            headerCell.sectionNameLabel.text = self.viewModel[indexPath.row].sectionNameText
            headerCell.titleLabel.text = self.viewModel[indexPath.row].titleText

            return headerCell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250;
        } else {
            return 100;
        }
    }
    
}

extension NewsfeedViewController : UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? NewsDetailViewController else {
                return
        }
        
        guard let selectedItem = newsTableView.indexPathsForSelectedRows?.first else {
            return
        }
        
        let selectedNews = sharedApplication.news[selectedItem.row]
        destination.selectedItem = selectedNews
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: showNewsDetailSegue, sender: tableView)
    }
    
}
