//
//  PickDateViewController.h
//  Lesson 36 HW 2
//
//  Created by Alex on 20.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol APPickDateViewControllerDelegate;

@interface PickDateViewController : UIViewController

@property (weak, nonatomic) id <APPickDateViewControllerDelegate> delegate;
@property (strong, nonatomic) NSDate* currentDate;
@property (strong, nonatomic) IBOutlet UIView *pickDateView;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickDateRoller;

- (IBAction)dateBirthEnteredAction:(UIButton *)sender;

@end


@protocol APPickDateViewControllerDelegate <NSObject>

@required

- (void)datePickDidEndEditing:(NSDate *)date;

@end

