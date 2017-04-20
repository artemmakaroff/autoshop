//
//  Auto.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Auto : NSObject

@property (strong, nonatomic)NSString *carName;
@property (strong, nonatomic)NSArray *modelArray;
@property (strong, nonatomic)NSNumber *yearOfIssue;
@property (strong, nonatomic)NSString *color;
@property (strong, nonatomic)NSNumber *price;
@property (strong, nonatomic)NSMutableDictionary *descriptionCarDictionary;

- (NSArray *)carCompanyArray;

@end
