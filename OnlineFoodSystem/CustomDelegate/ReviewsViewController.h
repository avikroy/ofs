//
//  ReviewsViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelBusiness.h"

@protocol ReviewsViewControllerDelegate;

@interface ReviewsViewController : UIViewController

@property(weak,nonatomic) id <ReviewsViewControllerDelegate> delegate;

+(ReviewsViewController*)sharedInstance;

@end



@protocol ReviewsViewControllerDelegate <NSObject>

@required

-(ModelBusiness*)selectedBusinessReviewsController:(ReviewsViewController*)controller;

@end