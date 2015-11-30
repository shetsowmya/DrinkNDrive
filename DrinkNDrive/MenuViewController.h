//
//  MenuViewController.h
//  DrinkNDrive
//
//  Created by Nidhi on 31/01/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookingViewController.h"
#import <MessageUI/MessageUI.h>


@interface MenuViewController : UIViewController<BookingControllerDelegate,MFMailComposeViewControllerDelegate,UINavigationControllerDelegate>

@property (strong) BookingViewController *bookingController;
@property (strong) MFMailComposeViewController *mailComposer;
- (IBAction)callUs:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *tarifPlansBtn;
@property (strong, nonatomic) IBOutlet UIButton *bookingBtn;
@property (strong, nonatomic) IBOutlet UIButton *contactUsBtn;
@property (strong, nonatomic) IBOutlet UIButton *callUsBtn;

@end
