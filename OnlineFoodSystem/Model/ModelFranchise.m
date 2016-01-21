//
//  ModelFranchise.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelFranchise.h"

@implementation ModelFranchise

@synthesize strID=_strID;
@synthesize strCity=_strCity;
@synthesize strEmail=_strEmail;
@synthesize strGA=_strGA;
@synthesize strCurrency=_strCurrency;
@synthesize strTax=_strTax;
@synthesize strTaxType=_strTaxType;

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            _strID=[dict objectForKey:@"id"];
        }else{
            _strID=@"";
        }
        if ([dict objectForKey:@"city"] && ![[dict objectForKey:@"city"] isKindOfClass:[NSNull class]]) {
            _strCity=[dict objectForKey:@"city"];
        }else{
            _strCity=@"";
        }
        if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]]) {
            _strEmail=[dict objectForKey:@"email"];
        }else{
            _strEmail=@"";
        }
        if ([dict objectForKey:@"ga"] && ![[dict objectForKey:@"ga"] isKindOfClass:[NSNull class]]) {
            _strGA=[dict objectForKey:@"ga"];
        }else{
            _strGA=@"";
        }
        if ([dict objectForKey:@"currency"] && ![[dict objectForKey:@"currency"] isKindOfClass:[NSNull class]]) {
            _strCurrency=[dict objectForKey:@"currency"];
        }else{
            _strCurrency=@"";
        }
        if ([dict objectForKey:@"tax"] && ![[dict objectForKey:@"tax"] isKindOfClass:[NSNull class]]) {
            _strTax=[dict objectForKey:@"tax"];
        }else{
            _strTax=@"";
        }
        if ([dict objectForKey:@"taxtype"] && ![[dict objectForKey:@"taxtype"] isKindOfClass:[NSNull class]]) {
            _strTaxType=[dict objectForKey:@"taxtype"];
        }else{
            _strTaxType=@"";
        }
    }
    return self;
}

@end
