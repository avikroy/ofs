//
//  ModelCatalogMenu.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelCatalogMenu.h"

typedef NS_ENUM(NSUInteger, DAYS) {
    EVERYDAY,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY,
};

NSString * const strDays[]={
    [EVERYDAY]  =   @"Every Day",
    [MONDAY]    =   @"Monday",
    [TUESDAY]   =   @"Tuesday",
    [WEDNESDAY] =   @"Wednesday",
    [THURSDAY]  =   @"Thursday",
    [FRIDAY]    =   @"Friday",
    [SATURDAY]  =   @"Saturday",
    [SUNDAY]    =   @"Sunday",
};

@implementation ModelCatalogMenu
@synthesize strName=_strName;
@synthesize strOpenCloseTime=_strOpenCloseTime;
@synthesize strDays=_strDays;




-(id)initWithDictionary:(NSDictionary*)dict Days:(NSInteger)days
{
    if (self=[super init]) {
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            _strName=[dict objectForKey:@"name"];
        }else{
            _strName=@"";
        }
        if ([dict objectForKey:@"openclosetime"] && ![[dict objectForKey:@"openclosetime"] isKindOfClass:[NSNull class]]) {
            _strOpenCloseTime=[dict objectForKey:@"openclosetime"];
        }else{
            _strOpenCloseTime=@"";
        }
        _strDays=strDays[days];
    }
    return self;
}

@end
