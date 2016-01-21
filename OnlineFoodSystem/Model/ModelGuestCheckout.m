//
//  ModelGuestCheckout.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 05/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "ModelGuestCheckout.h"

@implementation ModelGuestCheckout
@synthesize strID=_strID;
@synthesize strFieldName=_strFieldName;
@synthesize strFieldValue;
@synthesize required=_required;

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([[dict objectForKey:@"status"] boolValue] && ![[dict objectForKey:@"status"] isKindOfClass:[NSNull class]]) {
            if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
                _strID=[dict objectForKey:@"id"];
            }else{
                _strID=@"";
            }
            if ([dict objectForKey:@"field_name"] && ![[dict objectForKey:@"field_name"] isKindOfClass:[NSNull class]]) {
                _strFieldName=[dict objectForKey:@"field_name"];
            }else{
                _strFieldName=@"";
            }
            if ([dict objectForKey:@"required"] && ![[dict objectForKey:@"required"] isKindOfClass:[NSNull class]]) {
                _required=([[[dict objectForKey:@"required"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"])?YES:NO;
            }else{
                _required=NO;
            }
        }else{
            return nil;
        }
    }
    return self;
}

@end
