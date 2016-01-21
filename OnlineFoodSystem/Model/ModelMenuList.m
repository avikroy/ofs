//
//  ModelMenuList.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 13/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelMenuList.h"
#import "ModelDishes.h"
#import "AppDelegate.h"

@implementation ModelMenuList
@synthesize strID=_strID;
@synthesize arrDishes=_arrDishes;
@synthesize strCloseTime=_strCloseTime;
@synthesize strOpenTime=_strOpenTime;
@synthesize strWeekends=_strWeekends;

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        AppDelegate *appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            _strID=[dict objectForKey:@"id"];
        }else{
            _strID=@"";
        }
        if ([dict objectForKey:@"opentime"] && ![[dict objectForKey:@"opentime"] isKindOfClass:[NSNull class]]) {
            _strOpenTime=[dict objectForKey:@"opentime"];
        }else{
            _strOpenTime=@"";
        }
        if ([dict objectForKey:@"closetime"] && ![[dict objectForKey:@"closetime"] isKindOfClass:[NSNull class]]) {
            _strCloseTime=[dict objectForKey:@"closetime"];
        }else{
            _strCloseTime=@"";
        }
        if ([dict objectForKey:@"weekends"] && ![[dict objectForKey:@"weekends"] isKindOfClass:[NSNull class]]) {
            _strWeekends=[dict objectForKey:@"weekends"];
        }else{
            _strWeekends=@"";
        }
        if ([dict objectForKey:@"dish"] && ![[dict objectForKey:@"dish"] isKindOfClass:[NSNull class]]) {
            _arrDishes=[[dict objectForKey:@"dish"] mutableCopy];
            for (int i=0; i<_arrDishes.count; i++) {
                ModelDishes *obj=[[ModelDishes alloc] initWithDictionary:_arrDishes[i]];
                [_arrDishes removeObjectAtIndex:i];
                if (obj) {
                    [_arrDishes insertObject:obj atIndex:i];
                    if ([[[obj.strFeatures stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"T"]) {
                        [appDel.arrFavouriteCategory addObject:obj];
                    }
                }
            }
            
            appDel.arrCategory=[[appDel.arrCategory arrayByAddingObjectsFromArray:_arrDishes] mutableCopy];
        }else{
            _arrDishes=[NSMutableArray array];
        }
    }
    return self;
}

@end
