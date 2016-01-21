//
//  CountrySelectionViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelCountry.h"

@protocol CountrySelectionViewControllerDelegate;

@interface CountrySelectionViewController : UIViewController

+(CountrySelectionViewController*)sharedInstance;

@property(weak,nonatomic) id <CountrySelectionViewControllerDelegate> delegate;

@end


@protocol CountrySelectionViewControllerDelegate <NSObject>

@optional

-(void)didSelectedCountry:(ModelCountry*)selectedCountry;

@end
