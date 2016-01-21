//
//  ModelCategoryCustom.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelCategoryCustom.h"

@implementation ModelCategoryCustom

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            self.strID=[dict objectForKey:@"id"];
        }else{
            self.strID=@"";
        }
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            self.strName=[dict objectForKey:@"name"];
        }else{
            self.strName=@"";
        }
        if ([dict objectForKey:@"enabled"] && ![[dict objectForKey:@"enabled"] isKindOfClass:[NSNull class]]) {
            self.isEnable=[[dict objectForKey:@"enabled"] boolValue];
        }else{
            self.isEnable=NO;
        }
        if ([dict objectForKey:@"subcategory"] && ![[dict objectForKey:@"subcategory"] isKindOfClass:[NSNull class]]) {
            self.arrSubCategroy=[[dict objectForKey:@"subcategory"] mutableCopy];
        }else{
            self.arrSubCategroy=[NSMutableArray array];
        }
    }
    return self;
}

@end
