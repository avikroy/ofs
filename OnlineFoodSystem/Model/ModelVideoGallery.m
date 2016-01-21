//
//  ModelVideoGallery.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelVideoGallery.h"

@implementation ModelVideoGallery
@synthesize strID=_strID;
@synthesize strLink=_strLink;
@synthesize strName=_strName;
@synthesize strType=_strType;

-(id)initWithDictionary:(NSDictionary*)dict
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
        if ([dict objectForKey:@"link"] && ![[dict objectForKey:@"link"] isKindOfClass:[NSNull class]]) {
            _strLink=[dict objectForKey:@"link"];
        }else{
            _strLink=@"";
        }
        if ([dict objectForKey:@"type"] && ![[dict objectForKey:@"type"] isKindOfClass:[NSNull class]]) {
            _strType=[dict objectForKey:@"type"];
        }else{
            _strType=@"";
        }
    }
    return self;
}

@end
