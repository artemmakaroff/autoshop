//
//  MercedezBenz.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "MercedezBenz.h"

@implementation MercedezBenz

- (id)init
{
    self = [super init];
    
    if (self) {
        self.mercedezBenzArray = [NSMutableArray array];
        self.descriptionCarDictionary = [NSMutableDictionary dictionary];
        self.modelArray = [[NSArray alloc] initWithObjects:@"A100", @"C200", @"CLA", @"E300", @"G55", nil];
    }
    
    return self;
}

- (void)addNewCar:(NewCarViewController *)controller mercedesBenzDictionary:(NSMutableDictionary *)dictionary {
    
    self.descriptionCarDictionary = dictionary;
    
    NSString *a100 = @"http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/a-class/w176/fascination/05-2015/pictures_videos/fallback/mercedes-benz-a-class-w176_fallback_04_740x295_05-2015_jpg.object-Single-MEDIA.tmp/mercedes-benz-a-class_w176_fallback_04_740x295_05-2015.jpg";
    
    NSString *c200 = @"http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/c-class/w205/fascination/11-2013/pictures_videos/fallback/mercedes-benz-c-class-w205_fallback_01_740x295_11-2013_jpg.object-Single-MEDIA.tmp/mercedes-benz-c-class-w205_fallback_01_740x295_11-2013.jpg";
    
    NSString *cLA = @"http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/cla-class/c117/fascination/02-2016/pictures_videos/fallback/mercedes-benz-cla-c117_fallback_03_740x295_02-2016_jpg.object-Single-MEDIA.tmp/mercedes-benz-cla_c117_fallback_03_740x295_02-2016.jpg";
    
    NSString *e300 = @"http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/e-class/w213/fascination/11-2015/pictures_videos/fallback/mercedes-benz-e-class-w213_fallback_04_740x295_11-2015_jpg.object-Single-MEDIA.tmp/mercedes-benz-e-class_w213_fallback_04_740x295_11-2015.jpg";
    
    NSString *g55 = @"http://www.mercedes-benz.ru/content/media_library/hq/hq_mpc_reference_site/passenger_cars_ng/new_cars/models/g-class/_w463_crosscountry/fascination/06-2015/pictures_videos/fallback/mercedes-benz-g-class-stationwagon_w463_fallback_02_740x295_06-2015_jpg.object-Single-MEDIA.tmp/mercedes-benz-g-class-stationwagon_w463_fallback_02_740x295_06-2015.jpg";
    
    
    if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"A100"]) {
        [self.descriptionCarDictionary setObject:a100 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"C200"]) {
        [self.descriptionCarDictionary setObject:c200 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"CLA"]) {
        [self.descriptionCarDictionary setObject:cLA forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"E300"]) {
        [self.descriptionCarDictionary setObject:e300 forKey:@"URLCar"];
        
    } else if ([[self.descriptionCarDictionary objectForKey:@"CarModel"] isEqualToString:@"G55"]) {
        [self.descriptionCarDictionary setObject:g55 forKey:@"URLCar"];
        
    }
    
    [self.mercedezBenzArray addObject:dictionary];
    
}

@end
