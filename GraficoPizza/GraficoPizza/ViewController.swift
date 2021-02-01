//
//  ViewController.swift
//  GraficoPizza
//
//  Created by Henrique Matheus Alves Pereira on 31/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pieChartView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completarAction(_ sender: Any) {
        pieChartView.piePercentage = 100
    }

}
