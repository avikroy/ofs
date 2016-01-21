//
//  CategoryListViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryListViewControllerDelegate;

@interface CategoryListViewController : UIViewController

@property(weak,nonatomic) id <CategoryListViewControllerDelegate> delegate;

+(CategoryListViewController*)sharedInstance;

@end


@protocol CategoryListViewControllerDelegate <NSObject>

@required
-(NSMutableArray*)getListDataSource:(CategoryListViewController*)controller;

@optional
-(void)didSelectedCategoryIndex:(NSInteger)selectedIndex Controller:(CategoryListViewController*)controller;

@end