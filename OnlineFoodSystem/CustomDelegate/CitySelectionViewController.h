//
//  CitySelectionViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelCity.h"

@protocol CitySelectionViewControllerDelegate;

@interface CitySelectionViewController : UIViewController

@property(weak,nonatomic) id <CitySelectionViewControllerDelegate> delegate;

+(CitySelectionViewController*)sharedInstance;

@end


@protocol CitySelectionViewControllerDelegate <NSObject>

@required
-(NSString*)selectedCountryID:(CitySelectionViewController*)controller;

@optional
-(void)didSelectedCity:(ModelCity*)selectedCity Controller:(CitySelectionViewController*)controller;

@end