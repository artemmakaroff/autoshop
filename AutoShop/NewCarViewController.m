//
//  NewCarViewController.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "NewCarViewController.h"
#import "CompanyViewController.h"

@interface NewCarViewController () <UITextFieldDelegate, CompanyViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation NewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.carModelTextField.delegate = self;
    self.yearOfIssueTextField.delegate = self;
    self.colorTextField.delegate = self;
    self.priceTextField.delegate = self;

    self.carColor = [[CarColor alloc] init];
    
    //Создание кнопки Done для firstHoursTextField
    CGRect rectForToolBar = CGRectMake(0, 0, self.view.frame.size.width, 44);
    
    UIToolbar *modelToolBar = [[UIToolbar alloc] initWithFrame:rectForToolBar];
    [modelToolBar setTintColor:[UIColor grayColor]];
    
    UIBarButtonItem *modelCarDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                         style:UIBarButtonItemStyleDone
                                                                        target:self
                                                                        action:@selector(doneCarModel:)];
    
    [modelToolBar setItems:[NSArray arrayWithObjects:modelCarDoneButton, nil]];
    [self.carModelTextField setInputAccessoryView:modelToolBar];
    
    UIToolbar *colorToolBar = [[UIToolbar alloc] initWithFrame:rectForToolBar];
    [colorToolBar setTintColor:[UIColor grayColor]];
    
    
    UIBarButtonItem *colorDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                         style:UIBarButtonItemStyleDone
                                                                        target:self
                                                                        action:@selector(doneCarColor:)];
    
    [colorToolBar setItems:[NSArray arrayWithObjects:colorDoneButton, nil]];
    [self.colorTextField setInputAccessoryView:colorToolBar];
    
    UIToolbar *yearToolBar = [[UIToolbar alloc] initWithFrame:rectForToolBar];
    [yearToolBar setTintColor:[UIColor grayColor]];
    
    
    UIBarButtonItem *yearDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(doneCarYear:)];
    
    [yearToolBar setItems:[NSArray arrayWithObjects:yearDoneButton, nil]];
    [self.yearOfIssueTextField setInputAccessoryView:yearToolBar];
    
}

#pragma mark - UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"BMW"]) {
       return self.toyotaArray.count;
        
    } else if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"Mercedes Benz"]) {
        return self.mercedesBenzArray.count;
        
    } else if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"Toyota"]) {
        return self.toyotaArray.count;
        
    } else if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"Volkswagen"]) {
        return self.volkswagenArray.count;
    }
    
    if ([pickerView isEqual:self.colorPicker]) {
        return self.carColor.colorArray.count;
    }
    
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"BMW"]) {
        return [self.bmwArray objectAtIndex:row];
        
    } else if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"Mercedes Benz"]) {
        return [self.mercedesBenzArray objectAtIndex:row];
        
    } else if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"Toyota"]) {
        return [self.toyotaArray objectAtIndex:row];
        
    } else if ([pickerView isEqual:self.modelPicker] && [self.carCompanyLabel.text isEqualToString:@"Volkswagen"]) {
        return [self.volkswagenArray objectAtIndex:row];
    }
    
    if ([pickerView isEqual:self.colorPicker]) {
        return [self.carColor.colorArray objectAtIndex:row];
    }
    
    return nil;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.carModelTextField]) {
        
        self.modelPicker = [[UIPickerView alloc] init];
        self.modelPicker.dataSource = self;
        self.modelPicker.delegate = self;
        
        self.modelPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.modelPicker.showsSelectionIndicator = YES;
        self.carModelTextField.inputView  = self.modelPicker;
    }
    
    if ([textField isEqual:self.colorTextField]) {
        
        self.colorPicker = [[UIPickerView alloc] init];
        self.colorPicker.dataSource = self;
        self.colorPicker.delegate = self;
        
        self.colorPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.colorPicker.showsSelectionIndicator = YES;
        self.colorTextField.inputView  = self.colorPicker;
    }
    
    return YES;
}

#pragma mark - Delegates

- (void)addCompanyCar:(CompanyViewController *)controller didFinishEnterString:(NSString *)string {

    self.carCompanyLabel.text = string;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)cancelAction:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)saveAction:(id)sender {
    
    self.carDicionary = [[NSMutableDictionary alloc] init];
    
    [self.carDicionary setObject:self.carCompanyLabel.text forKey:@"CarCompany"];
    [self.carDicionary setObject:self.carModelTextField.text forKey:@"CarModel"];
    [self.carDicionary setObject:self.yearOfIssueTextField.text forKey:@"YearOfIssue"];
    [self.carDicionary setObject:self.colorTextField.text forKey:@"CarColor"];
    [self.carDicionary setObject:self.priceTextField.text forKey:@"CarPrice"];
    [self.carDicionary setObject:@"" forKey:@"URLCar"];
    
    if ([self.carCompanyLabel.text isEqualToString:@"BMW"]) {
        [self.bmwDelegate addNewCar:self bmwDicitionary:self.carDicionary];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Mercedes Benz"]) {
        [self.mercedesBenzDelegate addNewCar:self mercedesBenzDictionary:self.carDicionary];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Toyota"]) {
        [self.toyotaDelegate addNewCar:self toyotaDictionary:self.carDicionary];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Volkswagen"]) {
        [self.volkswagenDelegate addNewCar:self volkswagenDictionary:self.carDicionary];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"buttonSaveUserInteraction" object:nil];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)carCompanyAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CompanyViewController *companyViewController = [storyboard instantiateViewControllerWithIdentifier:@"CompanyViewController"];
    
    companyViewController.delegate = self;
    
    [self.navigationController pushViewController:companyViewController animated:YES];
    
}

- (void)doneCarModel:(UIBarButtonItem *)barButton {
    
    if ([self.carCompanyLabel.text isEqualToString:@"BMW"]) {
        self.carModelTextField.text = [self.bmwArray objectAtIndex:[self.modelPicker selectedRowInComponent:0]];
      
    } else if ([self.carCompanyLabel.text isEqualToString:@"Mercedes Benz"]) {
        self.carModelTextField.text = [self.mercedesBenzArray objectAtIndex:[self.modelPicker selectedRowInComponent:0]];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Toyota"]) {
        self.carModelTextField.text = [self.toyotaArray objectAtIndex:[self.modelPicker selectedRowInComponent:0]];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Volkswagen"]) {
        self.carModelTextField.text = [self.volkswagenArray objectAtIndex:[self.modelPicker selectedRowInComponent:0]];
        
    }
    [self.yearOfIssueTextField becomeFirstResponder];
}

- (void)doneCarColor:(UIBarButtonItem *)barButton {
    
    self.colorTextField.text = [self.carColor.colorArray objectAtIndex:[self.colorPicker selectedRowInComponent:0]];
    [self.priceTextField becomeFirstResponder];
}

- (void)doneCarYear:(UIBarButtonItem *)barButton {

    [self.colorTextField becomeFirstResponder];
}

@end
