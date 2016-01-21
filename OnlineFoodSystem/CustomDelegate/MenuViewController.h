//
//  MenuViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelBusiness.h"

@protocol MenuViewControllerDelegate;

@interface MenuViewController : UIViewController

@property(weak,nonatomic) id <MenuViewControllerDelegate> delegate;

+(MenuViewController*)sharedInstance;

@end


@protocol MenuViewControllerDelegate <NSObject>

@optional

-(void)didSelectedCategoryID:(NSString*)strCategoryID IndexPathRow:(NSInteger)row Controller:(MenuViewController*)controller;

@required

-(ModelBusiness*)selectedBusinessMenuController:(MenuViewController*)controller;

@end