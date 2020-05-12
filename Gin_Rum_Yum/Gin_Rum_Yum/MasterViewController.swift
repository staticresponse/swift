//
//  MasterViewController.swift
//  Gin_Rum_Yum
//
//  Created by Mike Lewis on 4/1/20.
//  Copyright © 2020 Mike Lewis. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var DrinksArray = [Drink]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        populateFromRest()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedDrink = DrinksArray[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.selectDrink = selectedDrink
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DrinksArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let selectedDrink = DrinksArray[indexPath.row]
        cell.textLabel!.text = selectedDrink.Drink_name
        cell.detailTextLabel!.text = selectedDrink.Drink_primaryIng
        let img = getImg(named: selectedDrink.Drink_pic)
        cell.imageView?.image = img
        
        tableView.separatorColor = UIColor.green
        tableView.tableFooterView = UIView(frame: CGRect(x:0.0,y:0.0,width:0.0,height:0.0))
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView!.layer.cornerRadius = 30
        cell.imageView!.clipsToBounds = true
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    //MARK: App Core Functions
    func getImg(named imageName:String) -> UIImage {
        let uri = URL(string: imageName)
        let dataBytes = try? Data(contentsOf:uri!)
        let img = UIImage(data: dataBytes!)
        return img!
    }
    
    func populateFromRest(){
        let github = "https://raw.githubusercontent.com/staticresponse/swift/master/rest.json"
        let jsURL:URL = URL(string: github)!
        let jsonData = try? Data (contentsOf: jsURL)
        //debug line 
        print(jsonData ?? "Error: No Data at endpoint")
        
        if (jsonData != nil) {
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            print(dictionary)
            let DrinkDictionary = dictionary["Drinks"]! as! [[String:AnyObject]]
            for index in 0...DrinkDictionary.count - 1 {
                let singleDrink = DrinkDictionary[index]
                let aDrink = Drink()
                
                aDrink.Drink_name = singleDrink["name"] as! String
                aDrink.Drink_inst = singleDrink["directions"] as! String
                aDrink.Drink_primaryIng = singleDrink["primaryIng"] as! String
                aDrink.Drink_ing2 = singleDrink["ing2"] as! String
                aDrink.Drink_ing3 = singleDrink["ing3"] as! String
                aDrink.Drink_ing4 = singleDrink["ing4"] as! String
                aDrink.Drink_ing5 = singleDrink["ing5"] as! String
                aDrink.Drink_ing6 = singleDrink["ing6"] as! String
                aDrink.Drink_ing7 = singleDrink["ing7"] as! String
                aDrink.Drink_pic = singleDrink["img"] as! String
                aDrink.Drink_vid = singleDrink["vid"] as! String
                aDrink.popList()
                DrinksArray.append(aDrink)
            }
        }
        
    }
}
