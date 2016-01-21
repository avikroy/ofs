//
//  PaymentSupportView.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 08/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelPaymentDetails.h"

@interface PaymentSupportView : UIView
{
    
}

@property(strong,nonatomic) IBOutlet UIScrollView *myScrollView;
@property(strong,nonatomic) ModelPaymentDetails *payment;

-(void)refresh;

@end
