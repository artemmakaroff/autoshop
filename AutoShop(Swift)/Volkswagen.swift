//
//  Volkswagen.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import Foundation

class Volkswagen: Auto, AddTableViewDelegate {

    let volkswagenArray = ["Polo", "Jetta", "Passat", "Tiguan", "Touareg"]
    
    let polo = "http://www.masmotors.ru/colors/volkswagen-polo/3.png"
    let jetta = "https://i.quto.ru/c533x400/4e3a4c8d925b4.png"
    let passat = "https://i.quto.ru/c533x400/4cef9b089c1df.jpeg"
    let tiguan = "https://i.quto.ru/c533x400/581b21057d3f3.jpeg"
    let touareg = "http://o.aolcdn.com/commerce/autodata/images/USC50VWS011B021001.jpg"
    
    func volkswagenDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String]) {
        
        self.carDictionary = carDictionary
        
        if self.carDictionary["CarModel"] == "Polo" {
            self.carDictionary["URLCar"] = polo
            
        } else if self.carDictionary["CarModel"] == "Jetta" {
            self.carDictionary["URLCar"] = jetta
            
        } else if self.carDictionary["CarModel"] == "Passat" {
            self.carDictionary["URLCar"] = passat
            
        } else if self.carDictionary["CarModel"] == "Tiguan" {
            self.carDictionary["URLCar"] = tiguan
            
        } else if self.carDictionary["CarModel"] == "Touareg" {
            self.carDictionary["URLCar"] = touareg
            
        }
        
        self.carArray.append(self.carDictionary)
        print(self.carDictionary)
    }
    
}
