//
//  ColonySelectionViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelColony.h"

@protocol ColonySelectionViewControllerDelegate;

@interface ColonySelectionViewController : UIViewController

@property(weak,nonatomic) id <ColonySelectionViewControllerDelegate> delegate;

+(ColonySelectionViewController*)sharedInstance;

@end

@protocol ColonySelectionViewControllerDelegate <NSObject>

@optional
-(void)didSelectedColony:(ModelColony*)selectedColony Controller:(ColonySelectionViewController*)controller;

@required
-(NSString*)selectedCityID:(ColonySelectionViewController*)controller;

@end
