//
//  MercedesBenz.swift
//  AutoShop(Swift)
//
//  Created by Artem Makarov on 28.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

import Foundation

class MerecedesBenz: Auto, AddTableViewDelegate {
    
    let mercedesArray = ["A100", "C200", "CLA", "E300", "G55"]
    
    let a100 = "http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/a-class/w176/fascination/05-2015/pictures_videos/fallback/mercedes-benz-a-class-w176_fallback_04_740x295_05-2015_jpg.object-Single-MEDIA.tmp/mercedes-benz-a-class_w176_fallback_04_740x295_05-2015.jpg"
    
    let c200 = "http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/c-class/w205/fascination/11-2013/pictures_videos/fallback/mercedes-benz-c-class-w205_fallback_01_740x295_11-2013_jpg.object-Single-MEDIA.tmp/mercedes-benz-c-class-w205_fallback_01_740x295_11-2013.jpg"
    
    let cLA = "http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/cla-class/c117/fascination/02-2016/pictures_videos/fallback/mercedes-benz-cla-c117_fallback_03_740x295_02-2016_jpg.object-Single-MEDIA.tmp/mercedes-benz-cla_c117_fallback_03_740x295_02-2016.jpg"
    
    let e300 = "http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/e-class/w213/fascination/11-2015/pictures_videos/fallback/mercedes-benz-e-class-w213_fallback_04_740x295_11-2015_jpg.object-Single-MEDIA.tmp/mercedes-benz-e-class_w213_fallback_04_740x295_11-2015.jpg"
    
    let g55 = "http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/g-class/_w463_crosscountry/fascination/06-2015/pictures_videos/fallback/mercedes-benz-g-class-stationwagon_w463_fallback_02_740x295_06-2015_jpg.object-Single-MEDIA.tmp/mercedes-benz-g-class-stationwagon_w463_fallback_02_740x295_06-2015.jpg"
    
    func mercedesDictionary(addTableViewController: AddTableViewController, carDictionary: [String:String]) {
        
        self.carDictionary = carDictionary
        
        if self.carDictionary["CarModel"] == "A100" {
            self.carDictionary["URLCar"] = a100
            
        } else if self.carDictionary["CarModel"] == "C200" {
            self.carDictionary["URLCar"] = c200
            
        } else if self.carDictionary["CarModel"] == "CLA" {
            self.carDictionary["URLCar"] = cLA
            
        } else if self.carDictionary["CarModel"] == "E300" {
            self.carDictionary["URLCar"] = e300
            
        } else if self.carDictionary["CarModel"] == "G55" {
            self.carDictionary["URLCar"] = g55
            
        }
        
        self.carArray.append(self.carDictionary)
        
    }
    
}
