//
//  TarifPlansViewController.h
//  DrinkNDrive
//
//  Created by Nidhi on 28/01/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TarifPlansViewController : UIViewController
- (IBAction)BackToMainMenu:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *onehrCost;
@property (strong, nonatomic) IBOutlet UITextView *onehr;
@property (strong, nonatomic) IBOutlet UITextView *twohrCost;
@property (strong, nonatomic) IBOutlet UITextView *twohr;
@property (strong, nonatomic) IBOutlet UITextView *threehrCost;

@property (strong, nonatomic) IBOutlet UITextView *threeHr;
@end
