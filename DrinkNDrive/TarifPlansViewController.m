//
//  TarifPlansViewController.m
//  DrinkNDrive
//
//  Created by Nidhi on 28/01/15.
//  Copyright (c) 2015 ShetCo. All rights reserved.
//

#import "TarifPlansViewController.h"

@interface TarifPlansViewController ()

@end

@implementation TarifPlansViewController

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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Tarrif_Page.png"]];
    self.view.backgroundColor = background;

    self.onehr.textColor = [UIColor whiteColor];
    self.onehrCost.textColor = [UIColor whiteColor];
     self.twohr.textColor = [UIColor whiteColor];
     self.twohrCost.textColor = [UIColor whiteColor];
     self.threeHr.textColor = [UIColor whiteColor];
     self.threehrCost.textColor = [UIColor whiteColor];
    self.onehr.backgroundColor = [UIColor blueColor];
    self.onehrCost.backgroundColor = [UIColor blueColor];
    self.twohr.backgroundColor = [UIColor blueColor];
    self.twohrCost.backgroundColor = [UIColor blueColor];
    self.threeHr.backgroundColor = [UIColor blueColor];
    self.threehrCost.backgroundColor = [UIColor blueColor];
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

- (IBAction)BackToMainMenu:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
