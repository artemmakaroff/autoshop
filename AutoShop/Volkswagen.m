//
//  Volkswagen.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Volkswagen.h"

@implementation Volkswagen 

- (id)init
{
    self = [super init];
    
    if (self) {
        self.volkswagenArray = [NSMutableArray array];
        self.descriptionCarDictionary = [NSMutableDictionary dictionary];
        self.modelArray = [[NSArray alloc] initWithObjects:@"Polo", @"Jetta", @"Passat", @"Tiguan", @"Touareg", nil];
    }
    
    return self;
}

- (void)addNewCar:(NewCarViewController *)controller volkswagenDictionary:(NSMutableDictionary *)dictionary {
    
    self.descriptionCarDictionary = dictionary;
    
    NSString *polo = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/03-corolla-img_tcm-3020-716204.jpg";
    NSString *jetta = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/1600-2_tcm-3020-949744.jpg";
    NSString *passat = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/0001-rav4-full_tcm-3020-760795.jpg";
    NSString *tiguan = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/027-lc-200-full-1_tcm-3020-669705.jpg";
    NSString *touareg = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/02_tcm-3020-684645.jpg";
    
    
    if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Polo"]) {
        [self.descriptionCarDictionary setObject:polo forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Jetta"]) {
        [self.descriptionCarDictionary setObject:jetta forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Passat"]) {
        [self.descriptionCarDictionary setObject:passat forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Tiguan"]) {
        [self.descriptionCarDictionary setObject:tiguan forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Touareg"]) {
        [self.descriptionCarDictionary setObject:touareg forKey:@"URLCar"];
        
    }
    
    [self.volkswagenArray addObject:dictionary];
    
}

@end
