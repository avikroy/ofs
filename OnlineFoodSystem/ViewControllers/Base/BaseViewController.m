//
//  BaseViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomAcitivityViewController.h"
#import "SVProgressHUD.h"

@interface BaseViewController ()<UITextFieldDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark General TextFieldDelegate
#pragma mark

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(id)getSuperViewOfType:(Class)classType FromView:(UIView*)view
{
    if ([view isKindOfClass:classType]) {
        return view;
    }else{
        while (view.superview) {
            view=view.superview;
            if ([view isKindOfClass:classType]) {
                return view;
            }else
                continue;
        }
    }
    return nil;
}

#pragma mark
#pragma mark IBAction Button back
#pragma mark

-(IBAction)btnBackPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark
#pragma mark Helper Method
#pragma mark

-(void)displayErrorMessage:(NSString*)strMsg
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    [alertController addAction:actionOK];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

#pragma mark
#pragma mark Custom Avtivity Indicator Method
#pragma mark

-(void)displayActivity
{
    [[CustomAcitivityViewController sharedInstance] displaActivityWithString:nil Completion:^(BOOL success) {
        
    }];
}

-(void)displayActivityWithMessage:(NSString *)strMsg
{
    [[CustomAcitivityViewController sharedInstance] displaActivityWithString:strMsg Completion:^(BOOL success) {
        
    }];
}

-(void)dismissActivity
{
    [[CustomAcitivityViewController sharedInstance] dismiss:^(BOOL success) {
        
    }];
}

-(BOOL)isNetworkRechable
{
    return self.appDel.isRechable;
}

@end
