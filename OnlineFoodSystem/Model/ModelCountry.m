//
//  ModelCountry.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelCountry.h"

@implementation ModelCountry

-(id)initWithDictionary:(NSDictionary *)dict
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
    }
    return self;
}

@end
