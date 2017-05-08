//
//  AddTableViewController.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import UIKit

@objc protocol AddTableViewDelegate {
    
    @objc optional func bmwDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String])
    @objc optional func mercedesDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String])
    @objc optional func toyotaDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String])
    @objc optional func volkswagenDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String])
}

class AddTableViewController: UITableViewController, CompanyTableViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var carCompanyLabel: UILabel!
    
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carYearTextField: UITextField!
    @IBOutlet weak var carColorTextField: UITextField!
    @IBOutlet weak var carPriceTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var string: String? = nil
    
    var bmwArray = [String]()
    var mercedesArray = [String]()
    var toyotaArray = [String]()
    var volkswagenArray = [String]()
    
    let carColor = CarColor()
    let carYear = Years()
    
    var bmwDelegate: AddTableViewDelegate?
    var mercedesDelegate: AddTableViewDelegate?
    var toyotaDelegate: AddTableViewDelegate?
    var volkswagenDelegate: AddTableViewDelegate?
    
    let modelPickerView = UIPickerView()
    let colorPickerView = UIPickerView()
    let yearPickerView = UIPickerView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carModelTextField.delegate = self
        self.carYearTextField.delegate = self
        self.carColorTextField.delegate = self
        self.carPriceTextField.delegate = self
        
        let rectForToolBar = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
        
        let modelToolBar = UIToolbar()
        modelToolBar.frame = rectForToolBar
        modelToolBar.tintColor = UIColor.gray
        
        let doneModelBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action:#selector(doneCarModel))
        
        modelToolBar.setItems([doneModelBarButton], animated: true)
        self.carModelTextField.inputAccessoryView = modelToolBar
        
        
        let yearToolBar = UIToolbar()
        yearToolBar.frame = rectForToolBar
        yearToolBar.tintColor = UIColor.gray
        
        let doneYearBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action:#selector(doneCarYear))
        
        yearToolBar.setItems([doneYearBarButton], animated: true)
        self.carYearTextField.inputAccessoryView = yearToolBar
        
        
        let colorToolBar = UIToolbar()
        colorToolBar.frame = rectForToolBar
        colorToolBar.tintColor = UIColor.gray
        
        let doneColorBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action:#selector(doneCarColor))
        
        colorToolBar.setItems([doneColorBarButton], animated: true)
        self.carColorTextField.inputAccessoryView = colorToolBar
        
        let priceToolbar = UIToolbar()
        priceToolbar.frame = rectForToolBar
        priceToolbar.tintColor = UIColor.gray
        
        let donePriceBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action:#selector(doneCarPrice))
        
        priceToolbar.setItems([donePriceBarButton], animated: true)
        self.carPriceTextField.inputAccessoryView = priceToolbar

        self.saveButton.isUserInteractionEnabled = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddTableViewController.endGesture))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: Gestures
    func endGesture() {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.view.endEditing(true)
        }, completion: nil)
        
        allTextFieldNotEmpty()
    }
    
    func allTextFieldNotEmpty() {
        
        if (self.carModelTextField.text?.characters.count)! > 1 &&
            (self.carModelTextField.text?.characters.count)! > 1 &&
            (self.carYearTextField.text?.characters.count)! > 1 &&
            (self.carColorTextField.text?.characters.count)! > 1 &&
            (self.carPriceTextField.text?.characters.count)! > 1 {

            self.saveButton.backgroundColor = UIColor(red:0.47, green:0.72, blue:0.32, alpha:1.0)
            self.saveButton.titleLabel?.textColor = UIColor.white
            self.saveButton.isUserInteractionEnabled = true
        }
        
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if (self.carCompanyLabel.text?.characters.count)! < 1 {
            return false
            
        } else {
        
        if textField == self.carModelTextField {
            
            self.modelPickerView.dataSource = self
            self.modelPickerView.delegate = self
            self.modelPickerView.showsSelectionIndicator = true
            self.carModelTextField.inputView = modelPickerView
            
        } else if textField == self.carColorTextField {
            
            self.colorPickerView.dataSource = self
            self.colorPickerView.delegate = self
            self.colorPickerView.showsSelectionIndicator = true
            self.carColorTextField.inputView = colorPickerView
        
        } else if textField == self.carYearTextField {
                
            self.yearPickerView.dataSource = self
            self.yearPickerView.delegate = self
            self.yearPickerView.showsSelectionIndicator = true
            self.carYearTextField.inputView = yearPickerView
                
            }
        
        return true
        }
    }
    
    //MARK: Actions
    @IBAction func cancelAction(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let carDictionary = ["CarCompany": self.carCompanyLabel.text,
                             "CarModel": self.carModelTextField.text,
                             "CarYear": self.carYearTextField.text,
                             "CarColor": self.carColorTextField.text,
                             "CarPrice": self.carPriceTextField.text]
        
        if self.carCompanyLabel.text == "BMW" {
            self.bmwDelegate?.bmwDictionary!(addTableViewController: self, carDictionary: carDictionary as! [String : String])
            
        } else if self.carCompanyLabel.text == "Mercedes Benz" {
            self.mercedesDelegate?.mercedesDictionary!(addTableViewController: self, carDictionary: carDictionary as! [String : String])
        
        } else if self.carCompanyLabel.text == "Toyota" {
            self.toyotaDelegate?.toyotaDictionary!(addTableViewController: self, carDictionary: carDictionary as! [String : String])
        
        } else if self.carCompanyLabel.text == "Volkswagen" {
            self.volkswagenDelegate?.volkswagenDictionary!(addTableViewController: self, carDictionary: carDictionary as! [String : String])
        }
        
        NotificationCenter.default.post(name: Notification.Name("notificationForTableView"), object: nil)
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "CompanyTableViewController") as! CompanyTableViewController
        
        controller.delegate = self
        self.view.endEditing(true)
        
        let emptyString = ""
        
        self.carCompanyLabel.text = emptyString
        self.carModelTextField.text = emptyString
        self.carYearTextField.text = emptyString
        self.carColorTextField.text = emptyString
        self.carPriceTextField.text = emptyString
        
        self.saveButton.isUserInteractionEnabled = false
        
        self.navigationController?.show(controller, sender: nil)
        
    }
    
    func doneCarModel() {

        if self.carCompanyLabel.text == "BMW" {
            self.carModelTextField.text = self.bmwArray[self.modelPickerView.selectedRow(inComponent: 0)]
            
        } else if self.carCompanyLabel.text == "Mercedes Benz" {
            self.carModelTextField.text = self.mercedesArray[self.modelPickerView.selectedRow(inComponent: 0)]
            
        } else if self.carCompanyLabel.text == "Toyota" {
            self.carModelTextField.text = self.toyotaArray[self.modelPickerView.selectedRow(inComponent: 0)]
            
        } else if self.carCompanyLabel.text == "Volkswagen" {
            self.carModelTextField.text = self.volkswagenArray[self.modelPickerView.selectedRow(inComponent: 0)]
        }
        allTextFieldNotEmpty()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.carYearTextField.becomeFirstResponder()
        }, completion: nil)

    }
    
    func doneCarYear() {
        self.carYearTextField.text = "\(self.carYear.yearArray[self.yearPickerView.selectedRow(inComponent: 0)])"
        allTextFieldNotEmpty()
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.carColorTextField.becomeFirstResponder()
        }, completion: nil)
    }
    
    func doneCarColor() {
        allTextFieldNotEmpty()
        self.carColorTextField.text = self.carColor.carColorArray[self.colorPickerView.selectedRow(inComponent: 0)]
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.carPriceTextField.becomeFirstResponder()
        }, completion: nil)
    }
    
    func doneCarPrice() {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.view.endEditing(true)
        }, completion: nil)
        
        allTextFieldNotEmpty()
        
    }
    
    //MARK: Delegates
    func companyString(companyViewController: CompanyTableViewController, companyString: String) {
        self.string = companyString
        self.carCompanyLabel.text = self.string
        
    }

    
    //MARK: UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == self.modelPickerView && self.carCompanyLabel.text == "BMW" {
            return self.bmwArray.count
            
        } else if pickerView == self.modelPickerView && self.carCompanyLabel.text == "Mercedes Benz" {
            return self.mercedesArray.count
            
        } else if pickerView == self.modelPickerView && self.carCompanyLabel.text == "Toyota" {
            return self.toyotaArray.count
            
        } else if pickerView == self.modelPickerView && self.carCompanyLabel.text == "Volkswagen" {
            return self.volkswagenArray.count

        }
        
        if pickerView == self.colorPickerView {
            return self.carColor.carColorArray.count
        
        } else if pickerView == self.yearPickerView {
           return self.carYear.yearArray.count
            
        } else {
            return 0
        }
        
        
    }
    
    //MARK: UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == self.modelPickerView && self.carCompanyLabel.text == "BMW" {
            return self.bmwArray[row]
            
        } else if pickerView == self.modelPickerView && self.carCompanyLabel.text == "Mercedes Benz" {
            return self.mercedesArray[row]
            
        } else if pickerView == self.modelPickerView && self.carCompanyLabel.text == "Toyota" {
            return self.toyotaArray[row]
            
        } else if pickerView == self.modelPickerView && self.carCompanyLabel.text == "Volkswagen" {
            return self.volkswagenArray[row]
            
        }
        
        if pickerView == self.colorPickerView {
            return self.carColor.carColorArray[row]
            
        } else if pickerView == self.yearPickerView {
            return "\(self.carYear.yearArray[row])"
            
        } else {
            return ""
        }
        
        
    }
    
}
