//
//  ModelCategory.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelCategory.h"

@implementation ModelCategory

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"ids"] && ![[dict objectForKey:@"ids"] isKindOfClass:[NSNull class]]) {
            self.arrIDS=[[dict objectForKey:@"ids"] mutableCopy];
        }else{
            self.arrIDS=[NSMutableArray array];
        }
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            self.strName=[dict objectForKey:@"name"];
        }else{
            self.strName=@"";
        }
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            self.strID=[dict objectForKey:@"id"];
        }else{
            self.strID=@"";
        }
    }
    return self;
}

@end
