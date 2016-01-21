//
//  ModelProductOptionOuter.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 16/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelProductOptionOuter.h"

@implementation ModelProductOptionOuter

@synthesize strID=_strID;
@synthesize strName=_strName;
@synthesize arrOption=_arrOption;

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
        if ([dict objectForKey:@"options"] && ![[dict objectForKey:@"options"] isKindOfClass:[NSNull class]]) {
            _arrOption=[[dict objectForKey:@"options"] mutableCopy];
            if (_arrOption.count>0) {
                for (int i=0; i<_arrOption.count; i++) {
                    ModelProductOptionInner *obj=[[ModelProductOptionInner alloc] initWithDictionary:_arrOption[i]];
                    [_arrOption removeObjectAtIndex:i];
                    if (obj) {
                        [_arrOption insertObject:obj atIndex:i];
                    }
                }
            }
        }else{
            _arrOption=[NSMutableArray array];
        }
    }
    return self;
}

@end
