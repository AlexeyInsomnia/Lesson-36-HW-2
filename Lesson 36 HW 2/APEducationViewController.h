//
//  APEducationViewController.h
//  Lesson 36 HW 2
//
//  Created by Alex on 21.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APEducationViewControllerDelegate;

@interface APEducationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<APEducationViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *educationTabelView;
@property (strong, nonatomic) NSString* selectedDegree;


- (IBAction)educationChoosedAction:(UIButton *)sender;


@end

@protocol APEducationViewControllerDelegate <NSObject>

-(void)dataFromEducationPickerController:(NSString*)educationString;

@end

