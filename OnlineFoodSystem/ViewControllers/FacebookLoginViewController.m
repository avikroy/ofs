//
//  FacebookLoginViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 01/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "FacebookLoginViewController.h"
#import "FacebookLoginWebService.h"
#import "CheckoutFormViewController.h"

@interface FacebookLoginViewController ()
{
    @private
    NSString *strName;
    NSString *strID;
    NSString *strEmail;
}

@end

@implementation FacebookLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnFBPressed:(id)sender
{
    [[FacebookLoginWebService service] loginUsingFBProfile:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            [self displayErrorMessage:strMsg];
        }else{
            NSLog(@"%@",(NSDictionary*)result);
            NSDictionary *dict=(NSDictionary*)result;
            strEmail=[dict objectForKey:@"email"];
            strID=[dict objectForKey:@"id"];
            strName=[dict objectForKey:@"name"];
            [self performSegueWithIdentifier:@"CheckoutFormViewController" sender:self];
        }
    } FromViewController:self];
}

-(IBAction)btnGuestPressed:(id)sender
{
    [self performSegueWithIdentifier:@"CheckoutFormViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CheckoutFormViewController"]) {
        CheckoutFormViewController *master=segue.destinationViewController;
        master.strEmail=strEmail;
        master.strName=strName;
    }
}


@end
