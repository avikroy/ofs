//
//  ModelBusinessOffer.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelBusinessOffer.h"

@implementation ModelBusinessOffer

@synthesize strRate=_strRate;
@synthesize strMinShop=_strMinShop;
@synthesize strStartDate=_strStartDate;
@synthesize strEndDate=_strEndDate;
@synthesize strValidDays=_strValidDays;
@synthesize strCreateDate=_strCreateDate;
@synthesize strDiscountText=_strDiscountText;
@synthesize accept=_accept;
@synthesize strBusiness=_strBusiness;

-(id)initWithDictionary:(NSDictionary *)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"rate"] && ![[dict objectForKey:@"rate"] isKindOfClass:[NSNull class]]) {
            _strRate=[dict objectForKey:@"rate"];
        }else{
            _strRate=@"";
        }
        if ([dict objectForKey:@"minshop"] && ![[dict objectForKey:@"minshop"] isKindOfClass:[NSNull class]]) {
            _strMinShop=[dict objectForKey:@"minshop"];
        }else{
            _strMinShop=@"";
        }
        if ([dict objectForKey:@"startdate"] && ![[dict objectForKey:@"startdate"] isKindOfClass:[NSNull class]]) {
            _strStartDate=[dict objectForKey:@"startdate"];
        }else{
            _strStartDate=@"";
        }
        if ([dict objectForKey:@"enddate"] && ![[dict objectForKey:@"enddate"] isKindOfClass:[NSNull class]]) {
            _strEndDate=[dict objectForKey:@"enddate"];
        }else{
            _strEndDate=@"";
        }
        if ([dict objectForKey:@"validdays"] && ![[dict objectForKey:@"validdays"] isKindOfClass:[NSNull class]]) {
            _strValidDays=[dict objectForKey:@"validdays"];
        }else{
            _strValidDays=@"";
        }
        if ([dict objectForKey:@"createdate"] && ![[dict objectForKey:@"createdate"] isKindOfClass:[NSNull class]]) {
            _strCreateDate=[dict objectForKey:@"createdate"];
        }else{
            _strCreateDate=@"";
        }
        if ([dict objectForKey:@"discounttext"] && ![[dict objectForKey:@"discounttext"] isKindOfClass:[NSNull class]]) {
            _strDiscountText=[dict objectForKey:@"discounttext"];
        }else{
            _strDiscountText=@"";
        }
        if ([dict objectForKey:@"accept"] && ![[dict objectForKey:@"accept"] isKindOfClass:[NSNull class]]) {
            _accept=([[[dict objectForKey:@"accept"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"])?YES:NO;
        }else{
            _accept=NO;
        }
        if ([dict objectForKey:@"business"] && ![[dict objectForKey:@"business"] isKindOfClass:[NSNull class]]) {
            _strBusiness=[dict objectForKey:@"business"];
        }else{
            _strBusiness=@"";
        }
    }
    return self;
}

@end
