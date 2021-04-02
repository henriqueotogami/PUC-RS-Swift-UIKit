//
//  ViewController.swift
//  ZoomImage
//
//  Created by Henrique Matheus Alves Pereira on 31/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var imagesArray: [(name: String,image: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesArray = [(" WATCH","img1"),("iOS 8","img2"),(" PAY","img3")]
        /* Photo by <a href="https://unsplash.com/@clementlauwaert?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Clément Lauwaert</a> on <a href="https://unsplash.com/s/photos/apple-watch?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>*/
        
        /*Photo by <a href="https://unsplash.com/@alvaro_pmzt20?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Alvaro Perez</a> on <a href="https://unsplash.com/s/photos/ios-14?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
         */
        
        /*Photo by <a href="https://unsplash.com/@naipo_de?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">naipo.de</a> on <a href="https://unsplash.com/s/photos/apple-pay?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
        */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tableViewcell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
        tableViewcell.textLabel?.text = imagesArray[indexPath.row].name
        
        return tableViewcell;
    }

    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dtVC = segue.destination as! DetailViewController
        
        let idxPath = tableView.indexPath(for: sender as! UITableViewCell) as NSIndexPath?
        
        dtVC.imgSelected = imagesArray[idxPath!.row].image
        
    }

}

