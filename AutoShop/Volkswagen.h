//
//  Volkswagen.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Auto.h"
#import "NewCarViewController.h"

@interface Volkswagen : Auto <NewCarViewControllerDelegate>

@property(strong, nonatomic) NSMutableArray *volkswagenArray;

@end
