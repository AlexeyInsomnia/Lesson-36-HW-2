//
//  APTableViewController.h
//  Lesson 36 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APDetailsViewController.h"

@interface APTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *birthDateTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *infoBarButtonItem;
@property (weak, nonatomic) IBOutlet UITextField *educationField;

- (IBAction)actionAdd:(UIBarButtonItem *)sender;



@end
