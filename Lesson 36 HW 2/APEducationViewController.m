//
//  APEducationViewController.m
//  Lesson 36 HW 2
//
//  Created by Alex on 21.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APEducationViewController.h"

static NSString* cellIdentifier = @"educationDegreeCell";

@interface APEducationViewController ()

@property (strong, nonatomic) NSArray* educationDegrees;

@end

@implementation APEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissInfoViewController:)];
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    self.educationDegrees = @[@"youngling", @"padavan", @"master", @"magister"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissInfoViewController:(UIGestureRecognizer*)gestureRecognizer {
    
    CGPoint point = [gestureRecognizer locationInView:self.view];
    UIView* tappedView = [self.view hitTest:point withEvent:nil];
    
    if ([tappedView isEqual:self.view]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Methods

-(UITableViewCellAccessoryType)accessoryTypeForCell:(UITableViewCell*)cell {
    
    UITableViewCellAccessoryType accessoryType = UITableViewCellAccessoryNone;
    
    if ([cell.textLabel.text isEqualToString:self.selectedDegree]) {
        accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return accessoryType;
}

 #pragma mark - Actions

- (IBAction)educationChoosedAction:(UIButton *)sender {
    
    [self.delegate dataFromEducationPickerController:self.selectedDegree];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    for (UITableViewCell* cell in [tableView visibleCells]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    self.selectedDegree = [self.educationDegrees objectAtIndex:indexPath.row];
    
    [tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.educationDegrees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [self.educationTabelView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.educationDegrees objectAtIndex:indexPath.row];
    cell.accessoryType = [self accessoryTypeForCell:cell];
    
    return cell;
}

@end


