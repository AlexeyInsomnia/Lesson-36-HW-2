//
//  APDetailsViewController.m
//  Lesson 36 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APDetailsViewController.h"

@interface APDetailsViewController ()

@end

@implementation APDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // dismiss by tap
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissInfoViewController)];
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}

-(void)dismissInfoViewController {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    
    NSLog(@"APDetailsViewController deallocated");
}

@end
