//
//  Auto.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Auto.h"

@implementation Auto

- (id)init
{
    self = [super init];
    
    if (self) {
        self.modelArray = [[NSArray alloc] initWithObjects:@"BMW", @"Mercedes Benz", @"Toyota", @"Volkswagen", nil];
    }
    
    return self;
}

@end
