//
//  MainViewController.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMW.h"
#import "MercedezBenz.h"
#import "Toyota.h"
#import "Volkswagen.h"

@interface MainViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *sectionArray;
@property (strong, nonatomic) NSDictionary *rowDictionary;
@property (strong, nonatomic) BMW *bmw;
@property (strong, nonatomic) MercedezBenz *mercedesBenz;
@property (strong, nonatomic) Toyota *toyota;
@property (strong, nonatomic) Volkswagen *volkswagen;

- (IBAction)addNewCar:(id)sender;

@end
