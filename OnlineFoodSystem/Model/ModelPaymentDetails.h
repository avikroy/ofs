//
//  ModelPaymentDetails.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelPaymentDetails : NSObject

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

-(id)initWithDictionary:(NSDictionary*)dict;

@end
