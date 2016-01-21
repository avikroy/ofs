//
//  CustomAcitivityViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CustomAcitivityViewController.h"
#import "SVProgressHUD.h"

@interface CustomAcitivityViewController ()

@end

@implementation CustomAcitivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(CustomAcitivityViewController*)sharedInstance
{
    static CustomAcitivityViewController *activity=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        activity=[[CustomAcitivityViewController alloc] initWithNibName:@"CustomAcitivityViewController" bundle:nil];
    });
    return activity;
}

-(void)displaActivityWithString:(NSString *)strMsg Completion:(void (^)(BOOL))handler
{
    UIWindow *myWindow=[[UIApplication sharedApplication] keyWindow];
    self.view.frame=[[UIScreen mainScreen] bounds];
    [myWindow addSubview:self.view];
    if (strMsg && [strMsg stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        [SVProgressHUD showWithStatus:strMsg];
    }else{
        [SVProgressHUD show];
    }
    handler(YES);
}

-(void)dismiss:(void (^)(BOOL))handler
{
    [SVProgressHUD dismiss];
    [self.view removeFromSuperview];
    handler(YES);
}

@end
