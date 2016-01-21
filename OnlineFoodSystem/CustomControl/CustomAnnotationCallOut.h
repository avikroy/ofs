//
//  CustomAnnotationCallOut.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 09/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentSupportView.h"
#import "RatingView.h"

@interface CustomAnnotationCallOut : UIView
{
    UIView *vw;
}

@property(strong,nonatomic) IBOutlet UILabel *lblName;
@property(strong,nonatomic) IBOutlet UILabel *lblRatings;
@property(strong,nonatomic) IBOutlet UILabel *lblAddress;
@property(strong,nonatomic) IBOutlet UILabel *lblDistance;
@property(strong,nonatomic) IBOutlet PaymentSupportView *vwPaymentSupport;
@property(strong,nonatomic) IBOutlet RatingView *vwRating;


@end
