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

class CapaTableViewController: UITableViewController {
    var noticiaAPICall: NoticiasAPICall!
    private var news: [Noticia]!
    var loadingData = false
    //    @IBOutlet var capaTableView: CapaTableView!
    
    private func configureTable(){
        noticiaAPICall = NoticiasAPICall()
        noticiaAPICall.fetchNoticias(){ news, error in
            self.news = news
        }
        self.tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NoticiaTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticiaTableViewCell")
        tableView.contentInset = UIEdgeInsets.zero
        tableView.contentInset.top = 20
        self.configureTable()
//        self.tableView.edgesForExtendedLayout = UIRectEdge;
        
        // Uncomment the following line to preserve selection between presentations
        //         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        //        self.capaTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.news?.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let simpleIdentifier = "NoticiaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleIdentifier, for: indexPath) as! (NoticiaTableViewCell)
        
        if indexPath.row < self.news.count{
            let new = self.news![indexPath.row] as Noticia!
            let secao = new?.secao as Secao!
        
            cell.secao.text = secao?.name
            cell.topico.text = new?.title
            return cell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.loadingData && indexPath.row == self.news.count - 1{
            self.loadingData = true
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "O Globo"
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: "NoticiaTableViewHeader", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        return view
    }
  
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let new = self.news[indexPath.row]
        
        let storyboard = UIStoryboard(name: "globonews", bundle:nil)
        let noticiaVC = storyboard.instantiateViewController(withIdentifier: "NoticiaViewController") as! NoticiaViewController
        //        noticiaVC.viewDidLoad()
        //        noticiaVC.setUpNoticiaView(titulo: new.title!, subtitulo: new.subTitle!, imagem: new.images[0].image! as Data, texto: new.texto!)
        self.present(noticiaVC, animated: true, completion: nil)
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        noticiaVC.navigationItem.backBarButtonItem = backItem
        
        noticiaVC.setUpNoticiaView(titulo: new.title!, subtitulo: new.subTitle!, imagem: new.img as! Data, texto: new.texto!, secao: new.secao!, autores: new.autores)
    }
    
    func setUpCell(cell: NoticiaTableViewCell, new: Noticia){
        cell.imagemNoticia.image = UIImage(data: new.img as! Data)
        let itemSize:CGSize = CGSize(width: 99, height: 85)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
        let imageRect : CGRect = CGRect(origin: .zero, size: CGSize(width: itemSize.width, height: itemSize.height))
        cell.imagemNoticia!.image?.draw(in: imageRect)
        let img = self.resizeImage(image: cell.imagemNoticia.image!, targetSize: itemSize)
        cell.imagemNoticia.image = img
    }
    
    func setUpCapa(new: Noticia, secao: Secao){
        //        self.tableView.setup(secao: (secao.name)!, titulo: (new.title)!)
        //        self.capaTableView.imagemCapa.image = UIImage(data: new.images[0].image! as Data)
    }
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
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

