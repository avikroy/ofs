//
//  ModelChoice.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 16/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelChoice.h"

@implementation ModelChoice

@synthesize strID=_strID,strName=_strName,strPrice=_strPrice;

-(instancetype)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            _strID=[dict objectForKey:@"id"];
        }else{
            _strID=@"";
        }
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            _strName=[dict objectForKey:@"name"];
        }else{
            _strName=@"";
        }
        if ([dict objectForKey:@"price"] && ![[dict objectForKey:@"price"] isKindOfClass:[NSNull class]]) {
            _strPrice=[dict objectForKey:@"price"];
        }else{
            _strPrice=@"";
        }
        self.selected=NO;
    }
    return self;
}

@end
