//
//  BMW.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "BMW.h"

@implementation BMW

- (NSArray *)modelArray {
    
    self.modelArray = [[NSArray alloc] initWithObjects:@"Model 1", @"Model 3", @"Model 5", @"Model 7", @"X5", nil];
    
    return self.modelArray;
    
}

@end
