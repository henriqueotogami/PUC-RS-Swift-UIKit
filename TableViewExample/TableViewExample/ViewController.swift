//
//  ViewController.swift
//  TableViewExample
//
//  Created by Henrique Matheus Alves Pereira on 26/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    

    var frutas = ["Abacate", "Abacaxi", "Acerola", "Ameixa", "Banana", "Caju", "Carambola", "Damasco", "Figo", "Goiaba", "Graviola", "Jaca", "Laranja", "Limão", "Maçã", "Manga", "Maracujá", "Melancia", "Melão", "Nectarina", "Pêssego", "Pitanga", "Romã", "Tangerina", "Uva"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Frutas"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.(withIdentifier: "Cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frutas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.lblDesc.text = frutas[indexPath.row]
        
        cell.lblNum.text = String(indexPath.row + 1)
        
        return cell
    }
    
}

