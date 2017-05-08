//
//  CompanyViewController.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Auto.h"

@protocol CompanyViewControllerDelegate;

@interface CompanyViewController : UITableViewController

@property (strong, nonatomic) Auto *autoClass;
@property(strong, nonatomic)NSArray *carsArray;
@property (weak, nonatomic) id <CompanyViewControllerDelegate> delegate;

@end

@protocol CompanyViewControllerDelegate

- (void)addCompanyCar:(CompanyViewController *)controller didFinishEnterString:(NSString *)string;

@end
