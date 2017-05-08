//
//  MainViewController.m
//  AutoShop
//
//  Created by Artem Makarov on 20.04.17.
//  Copyright © 2017 Artem Makarov. All rights reserved.
//

#import "MainViewController.h"
#import "NewCarViewController.h"
#import "MainViewCell.h"
#import "DetailViewController.h"

@interface MainViewController () <UITableViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    
    self.bmw = [[BMW alloc] init];
    self.mercedesBenz = [[MercedezBenz alloc] init];
    self.toyota = [[Toyota alloc] init];
    self.volkswagen = [[Volkswagen alloc] init];
    
    self.sectionArray = [[NSMutableArray alloc] init];
    [self.sectionArray addObject:self.bmw.bmwArray];
    [self.sectionArray addObject:self.mercedesBenz.mercedezBenzArray];
    [self.sectionArray addObject:self.toyota.toyotaArray];
    [self.sectionArray addObject:self.volkswagen.volkswagenArray];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(buttonSaveUserInteraction)
               name:@"buttonSaveUserInteraction"
             object:nil];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notifications

- (void)buttonSaveUserInteraction {
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self.sectionArray objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (self.bmw.bmwArray.count > 0 && section == 0) {
        return @"BMW";
    } else if (self.mercedesBenz.mercedezBenzArray.count > 0 && section == 1) {
        return @"Mercedes benz";
    } else if (self.toyota.toyotaArray.count > 0 && section == 2) {
        return @"Toyota";
    } else if (self.volkswagen.volkswagenArray.count > 0 && section == 3) {
        return @"Volkswagen";
    } else {
        return @"";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"reuseIdentifier";
    
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    self.rowDictionary = [[self.sectionArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    
    cell.modelNameLabel.text = [NSString stringWithFormat:@"Авто: %@ %@", [self.rowDictionary objectForKey:@"CarCompany"],
                                                                    [self.rowDictionary objectForKey:@"CarModel"]];
    cell.yearOfIssueLabel.text = [NSString stringWithFormat:@"Год выпуска: %@", [self.rowDictionary objectForKey:@"YearOfIssue"]];
    cell.colorLabel.text = [NSString stringWithFormat:@"Цвет: %@", [self.rowDictionary objectForKey:@"CarColor"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"Цена: %@", [self.rowDictionary objectForKey:@"CarPrice"]];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSURL *url = [NSURL URLWithString:[self.rowDictionary objectForKey:@"URLCar"]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       
                       dispatch_sync(dispatch_get_main_queue(), ^{
                           
                           UIImage *img = [[UIImage alloc] initWithData:data];
                           cell.carImageView.image = img;
                           
                       });
                       
                   });
    
    return cell;
}


#pragma mark - Actions

- (IBAction)addNewCar:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewCarViewController *newCarViewController = [storyboard instantiateViewControllerWithIdentifier:@"NewCarViewController"];
    
    newCarViewController.bmwDelegate = self.bmw;
    newCarViewController.mercedesBenzDelegate = self.mercedesBenz;
    newCarViewController.toyotaDelegate = self.toyota;
    newCarViewController.volkswagenDelegate = self.volkswagen;
    
    newCarViewController.bmwArray = self.bmw.modelArray;
    newCarViewController.mercedesBenzArray = self.mercedesBenz.modelArray;
    newCarViewController.toyotaArray = self.toyota.modelArray;
    newCarViewController.volkswagenArray = self.volkswagen.modelArray;
    
    [self.navigationController pushViewController:newCarViewController animated:YES];
    
}






@end
