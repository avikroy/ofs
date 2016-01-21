//
//  OrderTypeSelectorViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BusinessTypeSelectorDelegate;

@interface BusinessTypeSelectorViewController : UIViewController

+(BusinessTypeSelectorViewController*)sharedInstance;

@property(weak,nonatomic) id <BusinessTypeSelectorDelegate> delegate;

@property(strong,nonatomic) NSString *business_type;

-(void)setBusiness:(NSString*)strBusinessType;

@end




@protocol BusinessTypeSelectorDelegate <NSObject>

@optional

-(void)didSelected:(NSInteger)businessType Controller:(BusinessTypeSelectorViewController*)controller;

@end