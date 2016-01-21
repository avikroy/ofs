//
//  ModelBusinessReview.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelBusinessReview.h"

@implementation ModelBusinessReview
@synthesize strOrderID=_strOrderID;
@synthesize strQuality=_strQuality;
@synthesize strDelivery=_strDelivery;
@synthesize strDealer=_strDealer;
@synthesize strPackage=_strPackage;
@synthesize strPDate=_strPDate;
@synthesize strEmail=_strEmail;
@synthesize strComment=_strComment;
@synthesize strCity=_strCity;
@synthesize strAverage=_strAverage;
@synthesize strUser=_strUser;

-(id)initWithDictionary:(NSDictionary *)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"orderid"] && ![[dict objectForKey:@"orderid"] isKindOfClass:[NSNull class]]) {
            _strOrderID=[dict objectForKey:@"orderid"];
        }else{
            _strOrderID=@"";
        }
        if ([dict objectForKey:@"quality"] && ![[dict objectForKey:@"quality"] isKindOfClass:[NSNull class]]) {
            _strQuality=[dict objectForKey:@"quality"];
        }else{
            _strQuality=@"";
        }
        if ([dict objectForKey:@"delivery"] && ![[dict objectForKey:@"delivery"] isKindOfClass:[NSNull class]]) {
            _strDelivery=[dict objectForKey:@"delivery"];
        }else{
            _strDelivery=@"";
        }
        if ([dict objectForKey:@"dealer"] && ![[dict objectForKey:@"dealer"] isKindOfClass:[NSNull class]]) {
            _strDealer=[dict objectForKey:@"dealer"];
        }else{
            _strDealer=@"";
        }
        if ([dict objectForKey:@"package"] && ![[dict objectForKey:@"package"] isKindOfClass:[NSNull class]]) {
            _strPackage=[dict objectForKey:@"package"];
        }else{
            _strPackage=@"";
        }
        if ([dict objectForKey:@"pdate"] && ![[dict objectForKey:@"pdate"] isKindOfClass:[NSNull class]]) {
            _strPDate=[dict objectForKey:@"pdate"];
        }else{
            _strPDate=@"";
        }
        if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]]) {
            _strEmail=[dict objectForKey:@"email"];
        }else{
            _strEmail=@"";
        }
        if ([dict objectForKey:@"comment"] && ![[dict objectForKey:@"comment"] isKindOfClass:[NSNull class]]) {
            _strComment=[dict objectForKey:@"comment"];
        }else{
            _strComment=@"";
        }
        if ([dict objectForKey:@"city"] && ![[dict objectForKey:@"city"] isKindOfClass:[NSNull class]]) {
            _strCity=[dict objectForKey:@"city"];
        }else{
            _strCity=@"";
        }
        if ([dict objectForKey:@"average"] && ![[dict objectForKey:@"average"] isKindOfClass:[NSNull class]]) {
            _strAverage=[NSString stringWithFormat:@"%d",[[dict objectForKey:@"average"] integerValue]];
        }else{
            _strAverage=@"";
        }
        if ([dict objectForKey:@"user"] && ![[dict objectForKey:@"user"] isKindOfClass:[NSNull class]]) {
            _strUser=[dict objectForKey:@"user"];
        }else{
            _strUser=@"";
        }
    }
    return self;
}

@end
