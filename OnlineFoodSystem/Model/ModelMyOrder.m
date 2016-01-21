//
//  ModelMyOrder.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "ModelMyOrder.h"

@implementation ModelMyOrder

@synthesize strBusinessName=_strBusinessName;
@synthesize strCity=_strCity;
@synthesize strCityID=_strCityID;
@synthesize strDate=_strDate;
@synthesize strID=_strID;
@synthesize strStatus=_strStatus;
@synthesize strStatusText=_strStatusText;
@synthesize dictData=_dictData;

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            _strID=[dict objectForKey:@"id"];
        }else{
            _strID=@"";
        }
        if ([dict objectForKey:@"date"] && ![[dict objectForKey:@"date"] isKindOfClass:[NSNull class]]) {
            _strDate=[dict objectForKey:@"date"];
        }else{
            _strDate=@"";
        }
        if ([dict objectForKey:@"status"] && ![[dict objectForKey:@"status"] isKindOfClass:[NSNull class]]) {
            _strStatus=[dict objectForKey:@"status"];
        }else{
            _strStatus=@"";
        }
        if ([dict objectForKey:@"cityid"] && ![[dict objectForKey:@"cityid"] isKindOfClass:[NSNull class]]) {
            _strCityID=[dict objectForKey:@"cityid"];
        }else{
            _strCityID=@"";
        }
        if ([dict objectForKey:@"city"] && ![[dict objectForKey:@"city"] isKindOfClass:[NSNull class]]) {
            _strCity=[dict objectForKey:@"city"];
        }else{
            _strCity=@"";
        }
        if ([dict objectForKey:@"busname"] && ![[dict objectForKey:@"busname"] isKindOfClass:[NSNull class]]) {
            _strBusinessName=[dict objectForKey:@"busname"];
        }else{
            _strBusinessName=@"";
        }
        if ([dict objectForKey:@"statustext"] && ![[dict objectForKey:@"statustext"] isKindOfClass:[NSNull class]]) {
            _strStatusText=[dict objectForKey:@"statustext"];
        }else{
            _strStatusText=@"";
        }
        if ([dict objectForKey:@"data"] && ![[dict objectForKey:@"data"] isKindOfClass:[NSNull class]]) {
            NSData *dataTemp=[(NSString*)[dict objectForKey:@"data"] dataUsingEncoding:NSUTF8StringEncoding];
            _dictData=[NSJSONSerialization JSONObjectWithData:dataTemp options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"%@",[[NSString alloc] initWithData:dataTemp encoding:NSUTF8StringEncoding]);
        }else{
            _dictData=[NSDictionary dictionary];
        }
    }
    return self;
}

@end
