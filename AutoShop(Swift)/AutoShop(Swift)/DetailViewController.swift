//
//  DetailViewController.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 01.05.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var companyString = String()
    var yearString = String()
    var colorString = String()
    var priceString = String()
    var urlString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.companyLabel.text = self.companyString
        self.yearLabel.text = String(format: "Год выпуска: %@", self.yearString)
        self.colorLabel.text = String(format: "Цвет: %@", self.colorString)
        self.priceLabel.text = String(format: "Цена: %@", self.priceString)
        
        let url = URL(string: self.urlString)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            
            DispatchQueue.main.async {
                self.largeImageView.image = UIImage(data: data!)
                self.backgroundImage.image = UIImage(data: data!)
            }
        }
        
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Поздравляем!", message: String(format: "Вы купили автомобиль %@", self.companyString), preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
