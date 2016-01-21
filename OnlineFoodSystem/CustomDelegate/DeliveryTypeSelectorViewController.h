//
//  DeliveryTypeSelectorViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeliveryTypeSelectorViewControllerDelegate;

@interface DeliveryTypeSelectorViewController : UIViewController

+(DeliveryTypeSelectorViewController*)sharedInstance;

@property(weak,nonatomic) id <DeliveryTypeSelectorViewControllerDelegate> delegate;

@end


@protocol DeliveryTypeSelectorViewControllerDelegate <NSObject>

@required
-(NSMutableArray*)dataSourceArray:(DeliveryTypeSelectorViewController*)controller;
-(NSString*)displayedTitle:(DeliveryTypeSelectorViewController*)controller;

@optional
-(void)didSelectedIndex:(NSInteger)selectedIndex;

@end
