//
//  MercedezBenz.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "MercedezBenz.h"

@implementation MercedezBenz

- (NSArray *)modelArray {
    
    self.modelArray = [[NSArray alloc] initWithObjects:@"A100", @"C200", @"CLA", @"E300", @"G55", nil];
    
    return self.modelArray;
    
}

@end
