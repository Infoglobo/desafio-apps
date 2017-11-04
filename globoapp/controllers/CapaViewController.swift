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

class CapaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var noticiaAPICall: NoticiasAPICall!
    //    var noticiaViewModel : NoticiaViewModel!
    
    @IBOutlet weak var capaView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imagemCapa: UIImageView!
    
    @IBOutlet weak var tabBar: UITabBar!
    var finishedLoading = false
    private var news: [Noticia]!

    private func configureTable(){
        noticiaAPICall = NoticiasAPICall()
        noticiaAPICall.fetchNoticias(){ news, error in
            self.news = news
        }
        self.tableView.reloadData()
        finishedLoading = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTable()
        
        //        self.noticiaTblDataSource = NoticiaTableViewDataSource()
        
//        let imgCapa =  UIImage(data: news[0].images[0]?.image as! Data)
        let cgSize = CGSize(width: 95, height: 90)
//        self.imagemCapa.image = imgCapa
        
        self.news.remove(at: 0)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NoticiaTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticiaTableViewCell")
        
        let nib = UINib(nibName: "NoticiaTableViewHeader", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        
        self.tabBar.addSubview(view)
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
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.finishedLoading && indexPath.row == self.news.count - 1{
            self.finishedLoading = true
        }
        
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            let new = self.news[indexPath.row]
    
            let storyboard = UIStoryboard(name: "globonews", bundle:nil)
            let noticiaVC = storyboard.instantiateViewController(withIdentifier: "NoticiaViewController") as! NoticiaViewController
            //        noticiaVC.viewDidLoad()
            //        noticiaVC.setUpNoticiaView(titulo: new.title!, subtitulo: new.subTitle!, imagem: new.images[0].image! as Data, texto: new.texto!)
            self.present(noticiaVC, animated: true, completion: nil)
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            noticiaVC.navigationItem.backBarButtonItem = backItem
    
            noticiaVC.setUpNoticiaView(titulo: new.title!, subtitulo: new.subTitle!, imagem: new.images[0].image! as Data, texto: new.texto!)
        }
    
//    func setUpCellImage(cell: NoticiaTableViewCell, new: Noticia){
//        //        cell.imagemNoticia.image = UIImage(data: new.images[0].image! as Data)
//        let itemSize:CGSize = CGSize(width: 99, height: 90)
//        //        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
//        //        let imageRect : CGRect = CGRect(origin: .zero, size: CGSize(width: itemSize.width, height: itemSize.height))
//        //        cell.imagemNoticia!.image?.draw(in: imageRect)
//        //        let img = self.resizeImage(image: cell.imagemNoticia.image!, targetSize: itemSize)
//        if new.images.count > 0{
//            let img = UIImage(data: new.img?.image as! Data)
//            //        let imgNew = self.imageWithImage(image: img!, newSize: itemSize)
//            if img != nil{
//                cell.imagemNoticia.image = img
//            }
//
//        }else{
//            return ;
//        }
//    }
    
    func setUpCapa(new: Noticia, secao: Secao){
        //        self.tableView.setup(secao: (secao.name)!, titulo: (new.title)!)
        //        self.capaTableView.imagemCapa.image = UIImage(data: new.images[0].image! as Data)
    }
    
   
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}

