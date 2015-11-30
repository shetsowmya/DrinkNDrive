//
//  BookingViewController.m
//  DrinkNDrive
//
//  Created by Nidhi on 28/01/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import "BookingViewController.h"
#import "MenuViewController.h"

@interface BookingViewController ()


@end

@implementation BookingViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Home_DND.png"]];
    self.view.backgroundColor = background;

    self.name.delegate = self;
    self.email.delegate = self;
    self.mobileno.delegate = self;
    self.location.delegate = self;
    self.landmark.delegate = self;
    
    self.submitBtn.layer.cornerRadius = 6;
    self.submitBtn.layer.borderWidth = 1;
    self.submitBtn.layer.borderColor = [UIColor colorWithRed:148 green:0 blue:226 alpha:1].CGColor;
    self.submitBtn.layer.backgroundColor = [UIColor colorWithRed:186 green:85 blue:211 alpha:1].CGColor;
    
    self.date.tintColor = [UIColor yellowColor];
    [self.date setValue:[UIColor blackColor] forKeyPath:@"textColor"];
    self.date.backgroundColor = [UIColor whiteColor];
    
    self.date.alpha = 1.0;
    
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

- (IBAction)submit:(id)sender {
    NSManagedObjectContext * context = [self managedObjectContext];
    NSManagedObject * newBooking = [NSEntityDescription insertNewObjectForEntityForName:@"BookedEntries" inManagedObjectContext:context];
    
    
    if(([self.name.text isEqualToString:@""]) || ([self.mobileno.text isEqualToString:@""])||([self.email.text isEqualToString:@""])||([self.location.text isEqualToString:@""])||([self.landmark.text isEqualToString:@""] ))
    {
        
        UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Error!!"
                                                             message:@"Please fill in the details." delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil, nil];
        [ErrorAlert show];
    }
    
    else 
    {
        [newBooking setValue:self.name.text forKey:@"name"];
        [newBooking setValue:self.mobileno.text forKey:@"mobileno"];
        [newBooking setValue:self.email.text forKey:@"email"];
        [newBooking setValue:self.location.text forKey:@"location"];
        [newBooking setValue:self.landmark.text forKey:@"landmark"];
        [newBooking setValue:self.date.date forKey:@"date"];
        
        
        NSError * error = nil;
        
        if (![context save:&error]) {
            NSLog(@"error : %@",[error description]);
            
        }
    }


    
    
    if (![self validEmail:self.email.text] && ![self.email.text isEqualToString:@""]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Invalid Email ID" message:@"please enter valid email id" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
      //  self.email.text =  @"";
    }

//
    
//    NSManagedObjectContext * moc = [self managedObjectContext];
//    NSEntityDescription * entityDesc = [NSEntityDescription entityForName:@"BookedEntries" inManagedObjectContext:moc];
//    
//    
//    NSFetchRequest * fetchRequest = [NSFetchRequest alloc];
//    [fetchRequest setEntity:entityDesc];
//    
//    NSArray * entries = [[NSArray alloc]init];
//    entries = [moc executeFetchRequest:fetchRequest error:nil];
    

    //to send details to the mail id entered
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    if (![self.email.text isEqualToString:@""]) {
        [self sendMail];
    }
}


-(void)showErrorAlert
{
    
}

-(void)sendMail
{
    NSString * emailTitle = @"Details";
     NSString * messageBody = [NSString stringWithFormat:@"Following are the details:\n%@\n%@\n%@\n%@",self.name.text,self.mobileno.text,self.location.text,self.landmark.text];
    NSArray * toRecipents = [NSArray arrayWithObject:self.email.text];
    
    MFMailComposeViewController * mailComposer = [[MFMailComposeViewController alloc]init];
    if ([MFMailComposeViewController canSendMail]) {
        
    
    mailComposer.mailComposeDelegate = self;
    
    [mailComposer setSubject:emailTitle];
    [mailComposer setMessageBody:messageBody isHTML:NO];
    [mailComposer setToRecipients:toRecipents];
    [self presentViewController:mailComposer animated:YES completion:nil];
    }
}

    
    
    


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSLog(@"delegate called");
    switch (result) {
        case MFMailComposeResultCancelled:
            [self mailAlertMessage:@"message sending cancelled" title:@"Alert"];
            
            NSLog(@"Mail cancelled");
            break;

        case MFMailComposeResultFailed:
            [self mailAlertMessage:@"message sending failed" title:@"Alert"];
            
            NSLog(@"Mail failed");
            break;

            
        case MFMailComposeResultSaved:
            [self mailAlertMessage:@"message saved" title:@"Alert"];
            NSLog(@"Mail saved");
            break;

            
        case MFMailComposeResultSent:
            [self mailAlertMessage:@"message sent" title:@"Alert"];
            NSLog(@"Mail sent");
            break;

        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)validEmail:(NSString *)emailString
{
        NSString * regExpressionPattern = @"[a-z0-9!#$%&'`*+/=?^_`{|}~]+(?:.[a-z0-9!#$%&'`*+/=?^_`{|}~]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    NSRegularExpression * regEx = [[NSRegularExpression alloc] initWithPattern:regExpressionPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    if (regExMatches == 0) {
        return NO;
    }
    else
        return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"dismissed");
}

-(void)mailAlertMessage:(NSString *)message1 title:(NSString *)title
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                         message:message1 delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil, nil];
    [alert show];

}
@end
