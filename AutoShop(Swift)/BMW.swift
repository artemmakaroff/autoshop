//
//  BMW.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import Foundation

class BMW: Auto, AddTableViewDelegate {
    
    let bmwArray = ["Model 1", "Model 3", "Model 5", "Model 7", "X5"]
    
    let model1 = "http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/all-models/1-series/5-door/2015/at-a-glance/5-doors-m-sport-L.jpg"
    let model3 = "http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/images/market_spec_img/3_sedan_market.jpg"
    let model5 = "http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/images/market_spec_img/5sedan_market.jpg"
    let model7 = "http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/all-models/7-series/sedan/2015/at-a-glance/model.jpg"
    let x5 = "http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/images/market_spec_img/x5_market.jpg"
    
    
     func bmwDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String]) {
        
        self.carDictionary = carDictionary
        
        if self.carDictionary["CarModel"] == "Model 1" {
            self.carDictionary["URLCar"] = model1
            
        } else if self.carDictionary["CarModel"] == "Model 3" {
            self.carDictionary["URLCar"] = model3
            
        } else if self.carDictionary["CarModel"] == "Model 5" {
            self.carDictionary["URLCar"] = model5
            
        } else if self.carDictionary["CarModel"] == "Model 7" {
            self.carDictionary["URLCar"] = model7
            
        } else if self.carDictionary["CarModel"] == "X5" {
            self.carDictionary["URLCar"] = x5
            
        }
        
        
        self.carArray.append(self.carDictionary)
    }
}
