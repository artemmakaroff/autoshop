//
//  NewCarViewController.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewCarViewControllerDelegate;

@interface NewCarViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *carCompanyLabel;
@property (weak, nonatomic) IBOutlet UITextField *carModelTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearOfIssueTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@property (strong, nonatomic) UIDatePicker *yearOfIssueDatePicker;

@property (weak, nonatomic) id <NewCarViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableDictionary *carDicionary;
- (IBAction)cancelAction:(id)sender;
- (IBAction)saveAction:(id)sender;
- (IBAction)carCompanyAction:(id)sender;

@end

@protocol NewCarViewControllerDelegate

- (void)addNewCar:(NewCarViewController *)controller newCarDictionary:(NSDictionary *)dictionary;

@end
