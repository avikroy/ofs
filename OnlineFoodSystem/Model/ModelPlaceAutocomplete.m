//
//  ModelPlaceAutocomplete.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelPlaceAutocomplete.h"

@implementation ModelPlaceAutocomplete

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"description"] && ![[dict objectForKey:@"description"] isKindOfClass:[NSNull class]]) {
            self.strDescription=[dict objectForKey:@"description"];
        }else{
            self.strDescription=@"";
        }
        if ([dict objectForKey:@"place_id"] && ![[dict objectForKey:@"place_id"] isKindOfClass:[NSNull class]]) {
            self.strPlaceID=[dict objectForKey:@"place_id"];
        }else{
            self.strPlaceID=@"";
        }
    }
    return self;
}

@end
