//
//  BusinessTabViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 13/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BusinessTabViewControllerDelegate;

@interface BusinessTabViewController : UIViewController

@property(weak,nonatomic) id <BusinessTabViewControllerDelegate> delegate;

+(BusinessTabViewController*)sharedInstance;

-(void)setSelectedTab:(NSInteger)tabNo;

@end


@protocol BusinessTabViewControllerDelegate <NSObject>

@optional

-(void)didSelectedMenu:(BusinessTabViewController*)controller;
-(void)didSelectedInfo:(BusinessTabViewController*)controller;
-(void)didSelectedReviews:(BusinessTabViewController*)controller;
-(void)didSelectedOffers:(BusinessTabViewController*)controller;

@end