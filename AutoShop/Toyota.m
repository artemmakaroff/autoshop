//
//  Toyota.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Toyota.h"

@implementation Toyota

- (NSArray *)modelArray {
    
    self.modelArray = [[NSArray alloc] initWithObjects:@"Corolla", @"Camry", @"RAV 4", @"Land Cruiser", @"Land Cruiser Prado", nil];
    
    return self.modelArray;
    
}

@end
