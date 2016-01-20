//
//  APTableViewController.m
//  Lesson 36 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APTableViewController.h"
#import "PickDateViewController.h"
#import "APEducationViewController.h"

typedef enum : NSUInteger {
    APSenderBirthDateLabel          = 0,
    APSenderEducationLabel          = 1
} APSender;

@interface APTableViewController ()  <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, APPickDateViewControllerDelegate, APEducationViewControllerDelegate>

@property (strong, nonatomic) UIPopoverPresentationController* popover;

@end

@implementation APTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

-(void) infoPopoverFromSender:(id)sender {
    
    // grab the view controller we want to show
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    APDetailsViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"APDetailsViewController"];
    // present the controller
    // on iPad, this will be a Popover
    // on iPhone, this will be an action sheet
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    // configure the Popover presentation controller
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = sender;
    popController.delegate = self; // also done in storyboard
    
}

-(void) educationPopoverFromSender:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    APEducationViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"APEducationViewController"];
    controller.modalPresentationStyle = UIModalPresentationPopover;
    
    controller.delegate = self; // activate subscribe to delegate of pickdateviewcontroller
    
    [self presentViewController:controller animated:YES completion:nil];
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    // in case we don't have a bar button as reference
    popController.sourceView = sender;
    popController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    popController.sourceView = sender;
    popController.sourceRect = CGRectMake(0,0,0,0);
    popController.delegate = self; // also done in storyboard
}
-(void) dateOfBirthPopoverFromSender:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PickDateViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"PickDateViewController"];
    controller.modalPresentationStyle = UIModalPresentationPopover;
    
    controller.delegate = self; // activate subscribe to delegate of pickdateviewcontroller
    [self presentViewController:controller animated:YES completion:nil];
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    // in case we don't have a bar button as reference
    popController.sourceView = sender;
    popController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    popController.sourceView = sender;
    popController.sourceRect = CGRectMake(0,0,0,0);
    popController.delegate = self; // also done in storyboard
}


     
 # pragma mark - Actions

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    [self infoPopoverFromSender:sender];

}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    return YES;
    // Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
    // dismissal of the view.
}

#pragma mark - UITextFieldDelegate

// this made for changing event - no text editing, but popover

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
   
    NSLog(@"text field is pressed but only popover");
    
    
    
    switch (textField.tag) {
        case APSenderBirthDateLabel:
            [self dateOfBirthPopoverFromSender:textField];
            return NO;
            break;
            
        case APSenderEducationLabel:
            [self educationPopoverFromSender:textField];
            return NO;
            break;
            
        default:
            return YES;
            break;
    }
    
    
}

# pragma mark - Mine Delegates

- (void)datePickDidEndEditing:(NSDate *)date {
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"dd MMM yyyy"];
    self.birthDateTextField.text = [dateFormater stringFromDate:date];
    
    NSLog(@"%@",self.birthDateTextField.text);
    
}

-(void)dataFromEducationPickerController:(NSString *)educationString {
    
    self.educationField.text = educationString;
    
    NSLog(@"%@",self.educationField.text);
}


@end
