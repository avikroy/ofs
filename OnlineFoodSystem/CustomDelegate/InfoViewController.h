//
//  InfoViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelBusiness.h"

@protocol InfoViewControllerDelegate;

@interface InfoViewController : UIViewController

@property(weak,nonatomic) id <InfoViewControllerDelegate> delegate;

+(InfoViewController*)sharedInstance;

@end


@protocol InfoViewControllerDelegate <NSObject>

@required

-(ModelBusiness*)selectedBusinessInfoController:(InfoViewController*)controller;

@end