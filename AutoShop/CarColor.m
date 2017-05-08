//
//  CarColor.m
//  AutoShop
//
//  Created by Artem Makarov on 26.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "CarColor.h"

@implementation CarColor

- (id)init
{
    self = [super init];
    
    if (self) {

        self.colorArray = [[NSArray alloc] initWithObjects:@"Черный", @"Белый", @"Синий", nil];
    }
    
    return self;
}

@end
