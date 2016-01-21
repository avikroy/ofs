//
//  ModelTabSettings.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelTabSettings.h"

@implementation ModelTabSettings

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"tab_delivery"] && ![[dict objectForKey:@"tab_delivery"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_delivery"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isDelivery=YES;
            }else{
                self.isDelivery=NO;
            }
        }else{
            self.isDelivery=NO;
        }
        if ([dict objectForKey:@"tab_pickup"] && ![[dict objectForKey:@"tab_pickup"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_pickup"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isPickUp=YES;
            }else{
                self.isPickUp=NO;
            }
        }else{
            self.isPickUp=NO;
        }
        if ([dict objectForKey:@"tab_reservation"] && ![[dict objectForKey:@"tab_reservation"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_reservation"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isReservation=YES;
            }else{
                self.isReservation=NO;
            }
        }else{
            self.isReservation=NO;
        }
    }
    return self;
}

@end
