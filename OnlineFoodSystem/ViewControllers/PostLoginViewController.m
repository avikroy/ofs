//
//  PostLoginViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "PostLoginViewController.h"

@interface PostLoginViewController ()
{
    @private
    IBOutlet UIView *vwMain;
    IBOutlet UITableView *tblDisplay;
    
    IBOutlet UILabel *lblUserHeader;
    IBOutlet UIButton *btnUserName;
}

@end

@implementation PostLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    vwMain.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [tblDisplay reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)btnMyOrderPressed:(id)sender
{
    [self performSegueWithIdentifier:@"MyOrderViewController" sender:self];
}

-(IBAction)btnEditProfilePressed:(id)sender
{
    
}

-(IBAction)btnMyAccountPressed:(id)sender
{
    
}

-(IBAction)btnSignOutPressed:(id)sender
{
    
}

@end
