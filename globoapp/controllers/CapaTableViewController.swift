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
    @IBOutlet var capaTableView: CapaTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticiaAPICall = NoticiasAPICall()
        noticiaAPICall.fetchNoticias(){ news, error in
            self.news = news
        }
        
//        self.capaTableView.tableFooterView = UIView()
//        self.capaTableView.tableHeaderView = UIView()
        self.capaTableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        self.capaTableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticiaTableViewCell", for: indexPath) as! (NoticiaTableViewCell)
        let new = self.news![indexPath.row] as Noticia!
        let secao = new?.secao as Secao!
        if indexPath.row == 0{
            self.setUpCapa(new: new!, secao: secao!)
        }else{
            cell.secao.text = secao?.name
            cell.topico.text = new?.title
            if new!.images.count > 0{
                self.setUpCell(cell: cell, new: new!)
            }
        }
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticiaTableViewCell", for: indexPath) as! (NoticiaTableViewCell)
        let storyboard = UIStoryboard(name: "globonews", bundle: nil)
        
        let noticiaViewController = storyboard.instantiateViewController(withIdentifier: "NoticiaViewController") as! NoticiaViewController
  
    
//        noticiaViewController.noticiaView.titulo.text = cell.topico.text
        
        navigationController?.pushViewController(noticiaViewController, animated: true)
//        nvc.
        //        present(NoticiaViewController, animated: true, completion: nil)
    }
    
    func setUpCell(cell: NoticiaTableViewCell, new: Noticia){
        cell.imagemNoticia.image = UIImage(data: new.images[0].image! as! Data)
        let itemSize:CGSize = CGSize(width: 84, height: 50)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
        let imageRect : CGRect = CGRect(origin: .zero, size: CGSize(width: itemSize.width, height: itemSize.height))
        cell.imagemNoticia!.image?.draw(in: imageRect)
        let img = self.resizeImage(image: cell.imagemNoticia.image!, targetSize: itemSize)
        cell.imagemNoticia.image = img
    }
    
    func setUpCapa(new: Noticia, secao: Secao){
        self.capaTableView.setup(secao: (secao.name)!, titulo: (new.title)!)
        self.capaTableView.imagemCapa.image = UIImage(data: new.images[0].image! as Data)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
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

