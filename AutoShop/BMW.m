//
//  BMW.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "BMW.h"

@implementation BMW 

- (id)init
{
    self = [super init];
    
    if (self) {
        self.bmwArray = [NSMutableArray array];
        self.descriptionCarDictionary = [NSMutableDictionary dictionary];
        self.modelArray = [[NSArray alloc] initWithObjects:@"Model 1", @"Model 3", @"Model 5", @"Model 7", @"X5", nil];
    }
    
    return self;
}

- (void)addNewCar:(NewCarViewController *)controller bmwDicitionary:(NSMutableDictionary *)dictionary {
    
    self.descriptionCarDictionary = dictionary;
    
    NSString *model1 = @"http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/all-models/1-series/5-door/2015/at-a-glance/5-doors-m-sport-L.jpg";
    NSString *model3 = @"http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/images/market_spec_img/3_sedan_market.jpg";
    NSString *model5 = @"http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/images/market_spec_img/5sedan_market.jpg";
    NSString *model7 = @"http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/all-models/7-series/sedan/2015/at-a-glance/model.jpg";
    NSString *x5 = @"http://www.bmw-avtodom.ru/content/dam/bmw/marketRU/bmw_ru/images/market_spec_img/x5_market.jpg";
    
    
    if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Model 1"]) {
        [self.descriptionCarDictionary setObject:model1 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Model 3"]) {
        [self.descriptionCarDictionary setObject:model3 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Model 5"]) {
        [self.descriptionCarDictionary setObject:model5 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"Model 7"]) {
        [self.descriptionCarDictionary setObject:model7 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"X5"]) {
        [self.descriptionCarDictionary setObject:x5 forKey:@"URLCar"];
        
    }
    
    [self.bmwArray addObject:dictionary];

}

@end
