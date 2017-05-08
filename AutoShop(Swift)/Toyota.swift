//
//  Toyota.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import Foundation

class Toyota: Auto, AddTableViewDelegate {
    
    let toyotaArray = ["Corolla", "Camry", "RAV 4", "Land Cruiser", "Land Cruiser Prado"]
    
    let corolla = "https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/03-corolla-img_tcm-3020-716204.jpg"
    let camry = "https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/1600-2_tcm-3020-949744.jpg"
    let rAV4 = "https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/0001-rav4-full_tcm-3020-760795.jpg"
    let landCruiser = "https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/027-lc-200-full-1_tcm-3020-669705.jpg"
    let landCruiserPrado = "https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/02_tcm-3020-684645.jpg"
    
    func toyotaDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String]) {
        
        self.carDictionary = carDictionary
        
        if self.carDictionary["CarModel"] == "Corolla" {
            self.carDictionary["URLCar"] = corolla
            
        } else if self.carDictionary["CarModel"] == "Camry" {
            self.carDictionary["URLCar"] = camry
            
        } else if self.carDictionary["CarModel"] == "RAV 4" {
            self.carDictionary["URLCar"] = rAV4
            
        } else if self.carDictionary["CarModel"] == "Land Cruiser" {
            self.carDictionary["URLCar"] = landCruiser
            
        } else if self.carDictionary["CarModel"] == "Land Cruiser Prado" {
            self.carDictionary["URLCar"] = landCruiserPrado
            
        }
        
        self.carArray.append(self.carDictionary)
    }
    
}
