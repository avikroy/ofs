//
//  FilterViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BaseViewController.h"

//@protocol FilterViewControllerDelegate;

@interface FilterViewController : BaseViewController

//@property(weak,nonatomic) id <FilterViewControllerDelegate> delegate;

@end


/*
@protocol FilterViewControllerDelegate <NSObject>

@optional

-(void)filterOpenStatus:(BOOL)isOpen Controller:(FilterViewController*)controller;

-(void)flterFreeDeliveryStatus:(BOOL)isFreeDelivery Controller:(FilterViewController*)controller;

-(void)filterOfferCouponStatus:(BOOL)isCoupon Controller:(FilterViewController*)controller;

-(void)filterShowMap:(BOOL)isMap Controller:(FilterViewController*)controller;

-(void)filterSeletectedDistance:(NSInteger)distance Controller:(FilterViewController*)cntroller;

-(void)filterSelectedCusinies:(NSString*)strSelectedCusinies Controller:(FilterViewController*)controller;

-(void)filterApplyPressed:(FilterViewController*)controller;


@end
*/