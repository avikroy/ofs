//
//  OffersViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelBusiness.h"

@protocol OffersViewControllerDelegate;

@interface OffersViewController : UIViewController

@property(weak,nonatomic) id <OffersViewControllerDelegate> delegate;

+(OffersViewController*)sharedInstance;

@end


@protocol OffersViewControllerDelegate <NSObject>

@required

-(ModelBusiness*)selectedBusinessOffersController:(OffersViewController*)controller;

@end