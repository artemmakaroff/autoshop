//
//  MainViewCell.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *modelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearOfIssueLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;


@end
