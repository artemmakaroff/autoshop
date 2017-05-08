//
//  Toyota.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Auto.h"
#import "NewCarViewController.h"

@interface Toyota : Auto <NewCarViewControllerDelegate>

@property(strong, nonatomic) NSMutableArray *toyotaArray;

@end
