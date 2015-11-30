//
//  BookingViewController.h
//  DrinkNDrive
//
//  Created by Nidhi on 28/01/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@protocol BookingControllerDelegate <NSObject>

@end



@interface BookingViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *mobileno;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *location;

@property (weak, nonatomic) IBOutlet UITextField *landmark;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;

- (IBAction)submit:(id)sender;



@end
