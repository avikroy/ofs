//
//  SignInViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginWebService.h"
#import "ExplorerViewController.h"
#import "PostLoginViewController.h"

@implementation NSString (emailValidation)
-(BOOL)isValidEmail
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
@end

#import "SignInViewController.h"

@interface SignInViewController ()
{
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPwd;
}

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    txtEmail.text=@"superadmin@orderingonlinesystem.com";
    txtPwd.text=@"CoolOOS2015";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)alertChecking
{
    BOOL flag=YES;
    NSString *strMsg=@"";
    if ([txtEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        flag=NO;
        strMsg=@"Please enter your email";
    }
    else if ([txtPwd.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0){
        flag=NO;
        strMsg=@"Please enter your password";
    }
    else if (![[txtEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isValidEmail]){
        flag=NO;
        strMsg=@"Please enter the valid email id";
    }
    if (!flag) {
        [self displayErrorMessage:strMsg];
        return flag;
    }
    
    return flag;
    
}

-(IBAction)btnSignInPressed:(id)sender
{
    if ([self alertChecking]) {
        if ([self isNetworkRechable]) {
            [self displayActivityWithMessage:@"Please wait..."];
            [[LoginWebService service] callLoginServiceForEmail:txtEmail.text Password:txtPwd.text WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
                [self dismissActivity];
                if (isError) {
                    [self displayErrorMessage:strMsg];
                }else{
                    self.appDel.objUser=(ModelUser*)result;
                    [self performSegueWithIdentifier:@"PostLoginViewController" sender:self];
                }
            }];
        }else{
            [self displayErrorMessage:@"Network not rechable, please try again later..."];
        }
    }
}

@end
