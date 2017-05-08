//
//  MainTableViewController.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController{

    var bmwClass = BMW()
    var mercedesClass = MerecedesBenz()
    var toyotaClass = Toyota()
    var volkswagenClass = Volkswagen()
    
    var superCarArray: [[Dictionary<String, String>]] = []
    
    var companyString = String()
    var yearString = String()
    var colorString = String()
    var priceString = String()
    var urlString = String()
    
    let notificationForTableView = Notification.Name.init(rawValue: "notificationForTableView")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isUserInteractionEnabled = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MainTableViewController.reload),
                                               name: notificationForTableView,
                                               object: nil)
    }

    //MARK: Actions
    @IBAction func addNewCarAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
        
        controller.bmwDelegate = bmwClass
        controller.mercedesDelegate = mercedesClass
        controller.toyotaDelegate = toyotaClass
        controller.volkswagenDelegate = volkswagenClass
        
        controller.bmwArray = self.bmwClass.bmwArray
        controller.mercedesArray = self.mercedesClass.mercedesArray
        controller.toyotaArray = self.toyotaClass.toyotaArray
        controller.volkswagenArray = self.volkswagenClass.volkswagenArray
        
        self.navigationController?.show(controller, sender: nil)
        
    }
    
    //MARK: Notifications
    func reload(notification: Notification) {
        self.superCarArray = [self.bmwClass.carArray, self.mercedesClass.carArray, self.toyotaClass.carArray, self.volkswagenClass.carArray]
        print(self.superCarArray)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return superCarArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.superCarArray[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if self.bmwClass.carArray.count > 0 && section == 0 {
            return "BMW"
            
        } else if self.mercedesClass.carArray.count > 0 && section == 1 {
            return "Mercedes Benz"
            
        } else if self.toyotaClass.carArray.count > 0 && section == 2 {
            return "Toyota"
            
        } else if self.volkswagenClass.carArray.count > 0 && section == 3 {
            return "Volkswagen"
            
        } else {
            return""
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "reuseIdentifier"
        
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MainTableViewCell
        
        let rowDictionary: Dictionary = self.superCarArray[indexPath.section][indexPath.row]
        
        cell.carModelLabel.text = String(format: "Авто: %@ %@", rowDictionary["CarCompany"]!, rowDictionary["CarModel"]!)
        cell.carYearLabel.text = String(format: "Год выпуска: %@", rowDictionary["CarYear"]!)
        cell.carColorLabel.text = String(format: "Цвет: %@", rowDictionary["CarColor"]!)
        cell.carPriceLabel.text = String(format: "Цена: %@", rowDictionary["CarPrice"]!)
        
        let url = URL(string: String(format: "%@", rowDictionary["URLCar"]!))
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            
            DispatchQueue.main.async {
                cell.carImageView.image = UIImage(data: data!)
            }
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let rowDictionary: Dictionary = self.superCarArray[indexPath.section][indexPath.row]
        
        self.companyString = String(format: "%@ %@", rowDictionary["CarCompany"]!, rowDictionary["CarModel"]!)
        self.yearString = rowDictionary["CarYear"]!
        self.colorString = rowDictionary["CarColor"]!
        self.priceString = rowDictionary["CarPrice"]!
        self.urlString = rowDictionary["URLCar"]!
        
        controller.companyString = self.companyString
        controller.yearString = self.yearString
        controller.colorString = self.colorString
        controller.priceString = self.priceString
        controller.urlString = urlString
        
        self.navigationController?.show(controller, sender: nil)
        
//        let indexPath = tableView.indexPathForSelectedRow!
//        let currentCell = tableView.cellForRow(at: indexPath)! as! MainTableViewCell
//        
//        self.valueToPass = currentCell.carModelLabel.text!
//        print(valueToPass)
        //performSegue(withIdentifier: "showDetail", sender: self)
        
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        
//        let viewController = segue.destination as! DetailViewController
//            print("Privet")
//        viewController.companyString = self.valueToPass
//        print(self.valueToPass)
//        
//    }
}
