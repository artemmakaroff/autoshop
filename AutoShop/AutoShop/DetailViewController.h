//
//  DetailViewController.h
//  AutoShop
//
//  Created by Artem Makarov on 27.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@property (weak, nonatomic) IBOutlet UILabel *carNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *carYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *carColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *carPriceLabel;

@end
