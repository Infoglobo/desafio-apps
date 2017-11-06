//
//  CapaTableViewController.swift
//  globoapp
//
//  Created by Andre on 29/10/17.
//  Copyright © 2017 Andre. All rights reserved.
//

import UIKit
import AlamofireImage
import Foundation

enum MyErrorType:Error {
    case BadTimes
}

class CapaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var noticiaAPICall: NoticiasAPICall!
    
    @IBOutlet weak var capaView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imagemCapa: UIImageView!
    
    @IBOutlet weak var tituloCapa: UILabel!
    
    @IBOutlet weak var secaoCapa: UILabel!
    
    @IBOutlet weak var tabBar: UITabBar!
    var finishedLoading = false
    private var news: [Noticia]!
    
    private func setUpCapa(){
        let newCapa = news[0]
        let imgCapa =  UIImage(data: newCapa.images[0].image as! Data)
        self.imagemCapa.image = imgCapa
        self.tituloCapa.text = newCapa.title
        self.secaoCapa.text = newCapa.secao?.name
        self.news.remove(at: 0)
    }
    
    private func setUpModels(){
        noticiaAPICall = NoticiasAPICall()
        noticiaAPICall.fetchNoticias(){ news, error in
            self.news = news
        }
    }
    private func setUpTable(){
        
        self.tableView.reloadData()
        finishedLoading = false
    }
    
    private func setUpDelegateAndDataSource(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setUpCell(){
        tableView.register(UINib(nibName: "NoticiaTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticiaTableViewCell")
    }
    
    private func setUpHeader(){
        let nib = UINib(nibName: "NoticiaTableViewHeader", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        self.tabBar.addSubview(view)
    }
    
    private func setUpDetailedNew(new: Noticia, nextViewController: NoticiaViewController){
        if new.img == nil{
            let img_not_found = self.load(fileName: "Not_found", fileType: "jpg")!
            let data = UIImageJPEGRepresentation(img_not_found, 0.8)
            
            guard let title = new.title else{
                
                return
            }
            guard let subTitle = new.subTitle else{
                
                return
            }
            guard let texto = new.texto else{
                
                return
            }
            
            nextViewController.setUpNoticiaView(titulo: title, subtitulo: subTitle, imagem: data!, texto: texto, secao: new.secao!, autores: new.autores)
            
        }else{
            nextViewController.setUpNoticiaView(titulo: new.title!, subtitulo: new.subTitle!, imagem: new.img?.image! as! Data, texto: new.texto!, secao: new.secao!, autores: new.autores)
        }
    }
    
    private func setUpNewViewController(new: Noticia){
        let storyboard = UIStoryboard(name: "globonews", bundle:nil)
        let noticiaVC = storyboard.instantiateViewController(withIdentifier: "NoticiaViewController") as! NoticiaViewController
        
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.present(noticiaVC, animated: false, completion: nil)
        
        setUpDetailedNew(new: new, nextViewController: noticiaVC)
        
    }
    
    private func setUpCellInfo(cell: NoticiaTableViewCell, indexPath: IndexPath)-> UITableViewCell{
        
        if indexPath.row < self.news.count{
            let new = self.news![indexPath.row] as Noticia!
            let secao = new?.secao as Secao!
            if new != nil{
                cell.secao.text = secao?.name
                cell.topico.text = new?.title
                
                if new?.img != nil{
                    if let url = new?.img?.url{
                        let urlStr : NSString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) as! NSString
                        
                        let searchURL : NSURL = NSURL(string: urlStr as String)!
                        cell.imagemNoticia.af_setImage(withURL: searchURL as URL)
                    }
                    return cell
                }else{
                    let notFoundImage = self.load(fileName: "Not_found", fileType: "jpg")
                    cell.imagemNoticia.image = notFoundImage
                }
            }
        }
        return UITableViewCell()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpModels()
        self.setUpTable()
        self.setUpCapa()
        self.setUpDelegateAndDataSource()
        self.setUpCell()
        self.setUpHeader()
        //        self.noticiaTblDataSource = NoticiaTableViewDataSource()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.news?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let simpleIdentifier = "NoticiaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleIdentifier, for: indexPath) as! (NoticiaTableViewCell)
        
        return self.setUpCellInfo(cell: cell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.finishedLoading && indexPath.row == self.news.count - 1{
            self.finishedLoading = true
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = self.news[indexPath.row]
        setUpNewViewController(new: new)
    }
    private func load(fileName: String, fileType: String) -> UIImage?{
        if let path = Bundle.main.path(forResource: fileName, ofType:fileType) {
            // use path
            let imageURL = URL(fileURLWithPath: path)
            let image    = UIImage(contentsOfFile: imageURL.path)
            return image
        }else{
            return nil
        }
    }
  
    
}


