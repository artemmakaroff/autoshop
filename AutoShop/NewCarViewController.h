//
//  NewCarViewController.h
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarColor.h"

@protocol NewCarViewControllerDelegate;

@interface NewCarViewController : UITableViewController

@property (strong, nonatomic) CarColor *carColor;

@property (weak, nonatomic) IBOutlet UILabel *carCompanyLabel;
@property (weak, nonatomic) IBOutlet UITextField *carModelTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearOfIssueTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@property (strong, nonatomic) UIDatePicker *yearOfIssueDatePicker;

@property (weak, nonatomic) id <NewCarViewControllerDelegate> bmwDelegate;
@property (weak, nonatomic) id <NewCarViewControllerDelegate> mercedesBenzDelegate;
@property (weak, nonatomic) id <NewCarViewControllerDelegate> toyotaDelegate;
@property (weak, nonatomic) id <NewCarViewControllerDelegate> volkswagenDelegate;

@property (strong, nonatomic) NSMutableDictionary *carDicionary;
@property (strong, nonatomic) NSArray *bmwArray;
@property (strong, nonatomic) NSArray *mercedesBenzArray;
@property (strong, nonatomic) NSArray *toyotaArray;
@property (strong, nonatomic) NSArray *volkswagenArray;

@property (strong, nonatomic) UIPickerView *modelPicker;
@property (strong, nonatomic) UIPickerView *colorPicker;

- (IBAction)cancelAction:(id)sender;
- (IBAction)saveAction:(id)sender;
- (IBAction)carCompanyAction:(id)sender;

@end

@protocol NewCarViewControllerDelegate

@optional
- (void)addNewCar:(NewCarViewController *)controller bmwDicitionary:(NSMutableDictionary *)dictionary;
- (void)addNewCar:(NewCarViewController *)controller mercedesBenzDictionary:(NSMutableDictionary *)dictionary;
- (void)addNewCar:(NewCarViewController *)controller toyotaDictionary:(NSMutableDictionary *)dictionary;
- (void)addNewCar:(NewCarViewController *)controller volkswagenDictionary:(NSMutableDictionary *)dictionary;


@end
