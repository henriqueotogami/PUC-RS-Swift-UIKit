//
//  ViewController.swift
//  Persistencia
//
//  Created by Henrique Matheus Alves Pereira on 13/04/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: - Properties
    var dataSource: NSMutableArray! = NSMutableArray()

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.execUserDefaults()
        self.execCoreData()
    }
    
    // Mark: - Content
    func execUserDefaults(){
        
        // Get array from user defaults
        let defaultsArray: NSMutableArray! = NSMutableArray()
        if (UserDefaults.standard.array(forKey: "defaultsArray") != nil) {
            defaultsArray.addObjects(from: UserDefaults.standard.array(forKey: "defaultsArray")!)
        }
        
        // Add object
        defaultsArray.add("Defaults: \(defaultsArray.count + 1)")
        
        // Set new array in the user defaults
        UserDefaults.standard.set(defaultsArray, forKey: "defaultsArray")
        
        // Synchronize
        UserDefaults.standard.synchronize()
        
        // Add values to data source
        for index in 0...defaultsArray.count-1 {
            self.dataSource.add(defaultsArray[index])
        }
    }
    
    func execCoreData() {
        
        // Get Core Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedObjectContext: NSManagedObjectContext! = appDelegate.managedObjectContext
        
        // Create the error pointer
        var err: NSErrorPointer = nil
        
        // Add Company
        var apple: Company = NSEntityDescription.insertNewObjectForEntityForName("Company", inManagedObjectContext: managedObjectContext) as Company
        apple.name = "Apple"
        
        // Add Products
        var iPad: Product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: managedObject) as Product
        iPad.name = "iPad"
        iPad.price = 299
        iPad.company = apple
        
        var iPhone: Product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: managedObject) as Product
        iPhone.name = "iPad"
        iPhone.price = 199
        iPhone.company = apple
        
        // Save Context
        managedObjectContext.save(err)
        
        // Create the fetch request
        var fetchRequest = NSFetchRequest(entityName: "Company")
        
        // Fetch Companies
        var companies: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error:err)
        for index in 0...companies.count-1 {
            let company = companies[index] as Companyself.dataSource.addObject("Company: \(company.name)")!
        }
        
        // Fetch Products
        fetchRequest = NSFetchRequest(entityName: "Product")
        var products: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        for index in 0...products.count-1{
            let product = products[index] as Product
            var company = product.company as Company
            self.dataSource.addObject("Product: \(company.name)-\(product.name)")
        }
        
    }

    // Mark: - TableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as UITableViewCell
        
        let text = cell.viewWithTag(10) as! UILabel
        text.text = "\(self.dataSource[indexPath.row])"
        
        return cell
    }

    func tableView(tableView: UITableView, heightForAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
}

