//
//  PickDateViewController.m
//  Lesson 36 HW 2
//
//  Created by Alex on 20.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "PickDateViewController.h"
#import "APTableViewController.h"

@interface PickDateViewController ()

@end

@implementation PickDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // dismiss by tap
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissInfoViewController:)];
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.currentDate == nil) {
        [self.pickDateRoller setDate:[NSDate dateWithTimeIntervalSinceNow:0] animated:YES];
    } else {
        [self.pickDateRoller setDate:self.currentDate animated:YES];
    }
}


-(void)dismissInfoViewController:(UIGestureRecognizer*)gestureRecognizer {
 
 CGPoint point = [gestureRecognizer locationInView:self.view];
 UIView* tappedView = [self.view hitTest:point withEvent:nil];
 
 if ([tappedView isEqual:self.view]) {
 [self dismissViewControllerAnimated:YES completion:nil];
 }
}

- (IBAction)dateBirthEnteredAction:(UIButton *)sender {
    
    self.currentDate = self.pickDateRoller.date;
    
    [self.delegate datePickDidEndEditing:self.pickDateRoller.date];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)dealloc {
    
    NSLog(@"PickDateViewController deallocated");
}

@end



 

 
