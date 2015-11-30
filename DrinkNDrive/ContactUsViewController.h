//
//  ContactUsViewController.h
//  DrinkNDrive
//
//  Created by Nidhi on 19/02/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ContactUsViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UITextField *email;
- (IBAction)submit:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UITextField *message;
@end
