//
//  CompanyTableViewController.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import UIKit

protocol CompanyTableViewDelegate {
    
    func companyString(companyViewController: CompanyTableViewController, companyString: String)
}

class CompanyTableViewController: UITableViewController {
    
    let autoClass = Auto()
    var delegate: CompanyTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
        return self.autoClass.carCompanyArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "companyIdentifier"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.textLabel?.text = autoClass.carCompanyArray[indexPath.row]

        return cell
    }
 
// MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        
        let row = indexPath.row
        
        let stringCompany = String(format: "%@%", self.autoClass.carCompanyArray[row])

        self.delegate?.companyString(companyViewController: self, companyString: stringCompany)
        
        _ = navigationController?.popViewController(animated: true)
    }

}
