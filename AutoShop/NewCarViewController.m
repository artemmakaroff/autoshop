//
//  NewCarViewController.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "NewCarViewController.h"
#import "CompanyViewController.h"
#import "Auto.h"
#import "BMW.h"
#import "MercedezBenz.h"
#import "Toyota.h"
#import "Volkswagen.h"

@interface NewCarViewController () <UITextFieldDelegate, CompanyViewControllerDelegate>

@end

@implementation NewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.carModelTextField.delegate = self;
    self.yearOfIssueTextField.delegate = self;
    self.colorTextField.delegate = self;
    self.priceTextField.delegate = self;
    
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
    
    if ([self.carCompanyLabel.text isEqualToString:@"BMW"]) {
        BMW *bmw = [[BMW alloc] init];
        bmw.carMutableArray = [[NSMutableArray alloc] init];
        bmw.descriptionCarDictionary = [[NSMutableDictionary alloc] init];
        [bmw.descriptionCarDictionary setObject:self.carCompanyLabel.text forKey:@"CarCompany"];
        [bmw.descriptionCarDictionary setObject:self.carModelTextField.text forKey:@"CarModel"];
        [bmw.descriptionCarDictionary setObject:self.yearOfIssueTextField.text forKey:@"YearOfIssue"];
        [bmw.descriptionCarDictionary setObject:self.colorTextField.text forKey:@"CarColor"];
        [bmw.descriptionCarDictionary setObject:self.priceTextField.text forKey:@"CarPrice"];
        NSLog(@"%@", bmw.descriptionCarDictionary);
        [bmw.carMutableArray addObject:bmw.descriptionCarDictionary];
        NSLog(@"%@", bmw.carMutableArray);
        [self.delegate addNewCar:self newCarDictionary:bmw.descriptionCarDictionary];
        [self.navigationController popViewControllerAnimated:YES];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Mercedes Benz"]) {
        MercedezBenz *mercedezBenz = [[MercedezBenz alloc] init];
        mercedezBenz.descriptionCarDictionary = [[NSMutableDictionary alloc] init];
        [mercedezBenz.descriptionCarDictionary setObject:self.carCompanyLabel.text forKey:@"CarCompany"];
        [mercedezBenz.descriptionCarDictionary setObject:self.carModelTextField.text forKey:@"CarModel"];
        [mercedezBenz.descriptionCarDictionary setObject:self.yearOfIssueTextField.text forKey:@"YearOfIssue"];
        [mercedezBenz.descriptionCarDictionary setObject:self.colorTextField.text forKey:@"CarColor"];
        [mercedezBenz.descriptionCarDictionary setObject:self.priceTextField.text forKey:@"CarPrice"];
        
        [self.delegate addNewCar:self newCarDictionary:mercedezBenz.descriptionCarDictionary];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Toyota"]) {
        Toyota *toyota = [[Toyota alloc] init];
        toyota.descriptionCarDictionary = [[NSMutableDictionary alloc] init];
        [toyota.descriptionCarDictionary setObject:self.carCompanyLabel.text forKey:@"CarCompany"];
        [toyota.descriptionCarDictionary setObject:self.carModelTextField.text forKey:@"CarModel"];
        [toyota.descriptionCarDictionary setObject:self.yearOfIssueTextField.text forKey:@"YearOfIssue"];
        [toyota.descriptionCarDictionary setObject:self.colorTextField.text forKey:@"CarColor"];
        [toyota.descriptionCarDictionary setObject:self.priceTextField.text forKey:@"CarPrice"];
        
        [self.delegate addNewCar:self newCarDictionary:toyota.descriptionCarDictionary];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else if ([self.carCompanyLabel.text isEqualToString:@"Volkswagen"]) {
        Volkswagen *volkswagen = [[Volkswagen alloc] init];
        volkswagen.descriptionCarDictionary = [[NSMutableDictionary alloc] init];
        [volkswagen.descriptionCarDictionary setObject:self.carCompanyLabel.text forKey:@"CarCompany"];
        [volkswagen.descriptionCarDictionary setObject:self.carModelTextField.text forKey:@"CarModel"];
        [volkswagen.descriptionCarDictionary setObject:self.yearOfIssueTextField.text forKey:@"YearOfIssue"];
        [volkswagen.descriptionCarDictionary setObject:self.colorTextField.text forKey:@"CarColor"];
        [volkswagen.descriptionCarDictionary setObject:self.priceTextField.text forKey:@"CarPrice"];
        
        [self.delegate addNewCar:self newCarDictionary:volkswagen.descriptionCarDictionary];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
}

- (IBAction)carCompanyAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CompanyViewController *companyViewController = [storyboard instantiateViewControllerWithIdentifier:@"CompanyViewController"];
    
    companyViewController.delegate = self;
    
    [self.navigationController pushViewController:companyViewController animated:YES];
    
}
@end
