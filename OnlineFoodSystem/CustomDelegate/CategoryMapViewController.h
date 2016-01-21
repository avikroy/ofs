//
//  CategoryMapViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryMapViewControllerDelegate;

@interface CategoryMapViewController : UIViewController

@property(weak,nonatomic) id <CategoryMapViewControllerDelegate> delegate;

+(CategoryMapViewController*)sharedInstance;

@end



@protocol CategoryMapViewControllerDelegate <NSObject>

@required
-(NSMutableArray*)getMapDataSource:(CategoryMapViewController*)controller;

@optional
-(void)didSelectedIndex:(NSInteger)selectedIndex Controller:(CategoryMapViewController*)controller;

@end