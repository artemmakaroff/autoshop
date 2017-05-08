//
//  Toyota.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "Toyota.h"

@implementation Toyota

- (id)init
{
    self = [super init];
    
    if (self) {
        self.toyotaArray = [NSMutableArray array];
        self.descriptionCarDictionary = [NSMutableDictionary dictionary];
        self.modelArray = [[NSArray alloc] initWithObjects:@"Corolla", @"Camry", @"RAV 4", @"Land Cruiser", @"Land Cruiser Prado", nil];
    }
    
    return self;
}

- (void)addNewCar:(NewCarViewController *)controller toyotaDictionary:(NSMutableDictionary *)dictionary {
    
    self.descriptionCarDictionary = dictionary;
    
    NSString *corolla = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/03-corolla-img_tcm-3020-716204.jpg";
    NSString *camry = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/1600-2_tcm-3020-949744.jpg";
    NSString *rAV4 = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/0001-rav4-full_tcm-3020-760795.jpg";
    NSString *landCruiser = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/027-lc-200-full-1_tcm-3020-669705.jpg";
    NSString *landCruiserPrado = @"https://d1hu588lul0tna.cloudfront.net/toyotaone/ruru/02_tcm-3020-684645.jpg";
    
    
    if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Corolla"]) {
        [self.descriptionCarDictionary setObject:corolla forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Camry"]) {
        [self.descriptionCarDictionary setObject:camry forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"RAV 4"]) {
        [self.descriptionCarDictionary setObject:rAV4 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Land Cruiser"]) {
        [self.descriptionCarDictionary setObject:landCruiser forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Land Cruiser Prado"]) {
        [self.descriptionCarDictionary setObject:landCruiserPrado forKey:@"URLCar"];
        
    }
    
    [self.toyotaArray addObject:dictionary];
    
}

@end
