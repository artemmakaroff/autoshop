//
//  Volkswagen.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Volkswagen.h"

@implementation Volkswagen

- (NSArray *)modelArray {
    
    self.modelArray = [[NSArray alloc] initWithObjects:@"Polo", @"Jetta", @"Passat", @"Tiguan", @"Touareg", nil];
    
    return self.modelArray;
    
}

@end
