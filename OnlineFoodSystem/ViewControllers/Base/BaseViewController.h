//
//  BaseViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Device.h"
#import "AppDelegate.h"


@interface BaseViewController : UIViewController

@property(strong,nonatomic) AppDelegate *appDel;

-(id)getSuperViewOfType:(Class)classType FromView:(UIView*)view;
-(void)displayErrorMessage:(NSString*)strMsg;

-(void)displayActivity;
-(void)displayActivityWithMessage:(NSString*)strMsg;
-(void)dismissActivity;

-(BOOL)isNetworkRechable;

@end
