//
//  ModelPaymentDetails.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelPaymentDetails.h"

@implementation ModelPaymentDetails


/*
 
 {
 authorize = f;
 braintree = f;
 card = f;
 cash = t;
 maksekeskus = f;
 mercadopago = f;
 mercury = f;
 payeezy = f;
 paypal = t;
 paypaladaptive = f;
 payu = f;
 pexpress = f;
 skrill = f;
 transactium = f;
 voguepay = f;
 worldpay = f;
 }
 
*/

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        NSLog(@"%@",dict);
        
        if ([dict objectForKey:@"authorize"] && ![[dict objectForKey:@"authorize"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"authorize"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Authorized=NO;
            }else{
                self.is_Authorized=YES;
            }
        }
        if ([dict objectForKey:@"braintree"] && ![[dict objectForKey:@"braintree"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"braintree"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_BrainTree=NO;
            }else{
                self.is_BrainTree=YES;
            }
        }
        if ([dict objectForKey:@"card"] && ![[dict objectForKey:@"card"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"card"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Card=NO;
            }else{
                self.is_Card=YES;
            }
        }
        if ([dict objectForKey:@"cash"] && ![[dict objectForKey:@"cash"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"cash"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Cash=NO;
            }else{
                self.is_Cash=YES;
            }
        }
        if ([dict objectForKey:@"maksekeskus"] && ![[dict objectForKey:@"maksekeskus"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"maksekeskus"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_MakesEKEskus=NO;
            }else{
                self.is_MakesEKEskus=YES;
            }
        }
        if ([dict objectForKey:@"mercadopago"] && ![[dict objectForKey:@"mercadopago"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"mercadopago"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_MercadoPaGo=NO;
            }else{
                self.is_MercadoPaGo=YES;
            }
        }
        if ([dict objectForKey:@"mercury"] && ![[dict objectForKey:@"mercury"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"mercury"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Mercury=NO;
            }else{
                self.is_Mercury=YES;
            }
        }
        if ([dict objectForKey:@"payeezy"] && ![[dict objectForKey:@"payeezy"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"payeezy"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Payeezy=NO;
            }else{
                self.is_Payeezy=YES;
            }
        }
        if ([dict objectForKey:@"paypal"] && ![[dict objectForKey:@"paypal"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"paypal"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_PayPal=NO;
            }else{
                self.is_PayPal=YES;
            }
        }
        if ([dict objectForKey:@"paypaladaptive"] && ![[dict objectForKey:@"paypaladaptive"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"paypaladaptive"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_payPalAdaptive=NO;
            }else{
                self.is_payPalAdaptive=YES;
            }
        }
        if ([dict objectForKey:@"payu"] && ![[dict objectForKey:@"payu"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"payu"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_PayYou=NO;
            }else{
                self.is_PayYou=YES;
            }
        }
        if ([dict objectForKey:@"pexpress"] && ![[dict objectForKey:@"pexpress"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"pexpress"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_PexPress=NO;
            }else{
                self.is_PexPress=YES;
            }
        }
        if ([dict objectForKey:@"skrill"] && ![[dict objectForKey:@"skrill"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"skrill"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Skrill=NO;
            }else{
                self.is_Skrill=YES;
            }
        }
        if ([dict objectForKey:@"transactium"] && ![[dict objectForKey:@"transactium"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"transactium"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_Transactium=NO;
            }else{
                self.is_Transactium=YES;
            }
        }
        if ([dict objectForKey:@"voguepay"] && ![[dict objectForKey:@"voguepay"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"voguepay"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_VoguePay=NO;
            }else{
                self.is_VoguePay=YES;
            }
        }
        if ([dict objectForKey:@"worldpay"] && ![[dict objectForKey:@"worldpay"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"worldpay"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"]) {
                self.is_WorldPay=NO;
            }else{
                self.is_WorldPay=YES;
            }
        }
    }
    return self;
}

@end
