//
//  MenuViewController.m
//  DrinkNDrive
//
//  Created by Nidhi on 31/01/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Home_v3.png"]];
    
    self.view.backgroundColor = background;
    [self.tarifPlansBtn setImage: [UIImage imageNamed:@"B_Tariff.png"] forState:UIControlStateNormal];
//    [self.tarifPlansBtn setTitle:@"Tarif Plans" forState:UIControlStateNormal];
//    [self.tarifPlansBtn setImageEdgeInsets:UIEdgeInsetsMake(30.0, 10.0, 40.0, 10.0)];
//    [self.tarifPlansBtn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 30.0, 0.0, 0.0)];
//    
    [self.bookingBtn setImage:[UIImage imageNamed:@"B_BookNow.png"] forState:UIControlStateNormal];
//    [self.bookingBtn setTitle:@"Booking" forState:UIControlStateNormal];
//    [self.bookingBtn setImageEdgeInsets:UIEdgeInsetsMake(30.0, 10.0, 40.0, 30.0)];
//    [self.bookingBtn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
//    
    [self.contactUsBtn setImage:[UIImage imageNamed:@"B_ConUs.png"] forState:UIControlStateNormal];
//    [self.contactUsBtn setTitle:@"Contact Us" forState:UIControlStateNormal];
//    [self.contactUsBtn setImageEdgeInsets:UIEdgeInsetsMake(30.0, 30.0, 40.0, 20.0)];
//    [self.contactUsBtn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 40.0, 0.0, 0.0)];
//    
    [self.callUsBtn setImage:[UIImage imageNamed:@"B_CallUs.png"] forState:UIControlStateNormal];
//    [self.callUsBtn setTitle:@"Call Us" forState:UIControlStateNormal];
//    [self.callUsBtn setImageEdgeInsets:UIEdgeInsetsMake(30.0, 0.0, 40.0, 30.0)];
//    [self.callUsBtn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)callUs:(id)sender {
    
    NSLog(@"call us");
    NSString * phoneNo = @"9844763905";
    NSString * theCall = [NSString stringWithFormat:@"tel://%@",phoneNo];
    
    UIApplication  * myApp = [UIApplication sharedApplication];
    [myApp openURL:[NSURL URLWithString:theCall]];
}



-(void) returnAndSendMailWithSubject:(NSString *)subject Message:(NSString *)message ToRecipents:(NSArray *)recepients;
{
    NSLog(@"inside returnandsend");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"insside m,,,");
        // and present MFMailController from MainController
        self.mailComposer.delegate = self;
        
        _mailComposer.mailComposeDelegate = self;
        [_mailComposer setSubject:subject];
        [_mailComposer setMessageBody:message isHTML:NO];
        [_mailComposer setToRecipients:recepients];
        
        [self presentViewController:self.mailComposer animated:YES completion:nil];
    }];
    
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
            
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed");
            break;
            
            
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
            
            
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
            
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSUInteger)supportedInterfaceOrientation{
    return UIInterfaceOrientationPortrait;
}
- (BOOL)shouldAutorotate {
    
    return NO;
}

@end
