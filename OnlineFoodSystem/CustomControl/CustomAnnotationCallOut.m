//
//  CustomAnnotationCallOut.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 09/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CustomAnnotationCallOut.h"

@implementation CustomAnnotationCallOut

-(id)init
{
    if (self=[super init]) {
        [self initialize];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    vw=[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    self.lblName=(UILabel*)[vw viewWithTag:1];
    self.vwRating=(RatingView*)[vw viewWithTag:2];
    self.lblRatings=(UILabel*)[vw viewWithTag:3];
    self.lblAddress=(UILabel*)[vw viewWithTag:4];
    self.lblDistance=(UILabel*)[vw viewWithTag:5];
    self.vwPaymentSupport=(PaymentSupportView*)[vw viewWithTag:6];
    
    vw.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:vw];
}

@end
