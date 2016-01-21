//
//  PaymentSupportView.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 08/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "PaymentSupportView.h"

@implementation PaymentSupportView
@synthesize myScrollView,payment;


/*
 @property(assign,nonatomic) BOOL is_PayYou;
 @property(assign,nonatomic) BOOL is_Cash;
 @property(assign,nonatomic) BOOL is_Card;
 @property(assign,nonatomic) BOOL is_PayPal;
 @property(assign,nonatomic) BOOL is_payPalAdaptive;
 @property(assign,nonatomic) BOOL is_Authorized;
 @property(assign,nonatomic) BOOL is_BrainTree;
 @property(assign,nonatomic) BOOL is_Mercury;
 @property(assign,nonatomic) BOOL is_WorldPay;
 @property(assign,nonatomic) BOOL is_MercadoPaGo;
 @property(assign,nonatomic) BOOL is_Transactium;
 @property(assign,nonatomic) BOOL is_PexPress;
 @property(assign,nonatomic) BOOL is_MakesEKEskus;
 @property(assign,nonatomic) BOOL is_VoguePay;
 @property(assign,nonatomic) BOOL is_Skrill;
 @property(assign,nonatomic) BOOL is_Payeezy;

*/
-(void)refresh
{
    if (myScrollView) {
        myScrollView=nil;
    }
    myScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:myScrollView];
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    NSLog(@"%@",NSStringFromCGRect(myScrollView.frame));
    CGFloat totalWidth=0.0f;
    if (payment.is_PayYou) {
        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_paypal.png"]];
        img.frame=CGRectMake(totalWidth, 0, 20, myScrollView.frame.size.height);
        [myScrollView addSubview:img];
        img.contentMode=UIViewContentModeScaleAspectFit;
        totalWidth+=20;
        myScrollView.contentSize=CGSizeMake(img.frame.size.width, myScrollView.frame.size.height);
    }
    if (payment.is_Cash) {
        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cod.png"]];
        img.frame=CGRectMake(totalWidth, 0, 20, myScrollView.frame.size.height);
        [myScrollView addSubview:img];
        img.contentMode=UIViewContentModeScaleAspectFit;
        totalWidth+=20;
        myScrollView.contentSize=CGSizeMake(img.frame.size.width+img.frame.origin.x, myScrollView.frame.size.height);
    }
    if (payment.is_Card) {
        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mastercard.png"]];
        img.frame=CGRectMake(totalWidth, 0, 20, myScrollView.frame.size.height);
        [myScrollView addSubview:img];
        img.contentMode=UIViewContentModeScaleAspectFit;
        totalWidth+=20;
        myScrollView.contentSize=CGSizeMake(img.frame.size.width+img.frame.origin.x, myScrollView.frame.size.height);
    }
    if (payment.is_PayPal) {
        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_paypal.png"]];
        img.frame=CGRectMake(totalWidth, 0, 20, myScrollView.frame.size.height);
        [myScrollView addSubview:img];
        img.contentMode=UIViewContentModeScaleAspectFit;
        totalWidth+=20;
        myScrollView.contentSize=CGSizeMake(img.frame.size.width+img.frame.origin.x, myScrollView.frame.size.height);
    }
    if (payment.is_payPalAdaptive) {
        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_paypal.png"]];
        img.frame=CGRectMake(totalWidth, 0, 20, myScrollView.frame.size.height);
        [myScrollView addSubview:img];
        img.contentMode=UIViewContentModeScaleAspectFit;
        totalWidth+=20;
        myScrollView.contentSize=CGSizeMake(img.frame.size.width+img.frame.origin.x, myScrollView.frame.size.height);
    }
}

@end
