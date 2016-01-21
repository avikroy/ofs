//
//  ModelPickUpSettings.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelPickUpSettings.h"

@implementation ModelPickUpSettings

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"tab_pickup_country"] && ![[dict objectForKey:@"tab_pickup_country"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_pickup_country"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isPickUpCountry=YES;
            }else{
                self.isPickUpCountry=NO;
            }
        }else{
            self.isPickUpCountry=NO;
        }
        if ([dict objectForKey:@"tab_pickup_city"] && ![[dict objectForKey:@"tab_pickup_city"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_pickup_city"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isPickUpCity=YES;
            }else{
                self.isPickUpCity=NO;
            }
        }else{
            self.isPickUpCity=NO;
        }
        if ([dict objectForKey:@"tab_pickup_option"] && ![[dict objectForKey:@"tab_pickup_option"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_pickup_option"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                //self.isPickUpOption=YES;
                self.isPickUpOption=NO; //For the time
            }else{
                self.isPickUpOption=NO;
            }
        }else{
            self.isPickUpOption=NO;
        }
    }
    return self;
}

@end
