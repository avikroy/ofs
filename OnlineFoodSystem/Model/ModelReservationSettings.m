//
//  ModelReservationSettings.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelReservationSettings.h"

@implementation ModelReservationSettings

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"tab_reservation_country"] && ![[dict objectForKey:@"tab_reservation_country"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_reservation_country"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isReservationCountry=YES;
            }else{
                self.isReservationCountry=NO;
            }
        }else{
            self.isReservationCountry=NO;
        }
        if ([dict objectForKey:@"tab_reservation_city"] && ![[dict objectForKey:@"tab_reservation_city"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_reservation_city"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isReservationCity=YES;
            }else{
                self.isReservationCity=NO;
            }
        }else{
            self.isReservationCity=NO;
        }
        if ([dict objectForKey:@"tab_reservation_option"] && ![[dict objectForKey:@"tab_reservation_option"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_reservation_option"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                //self.isReservationOption=YES;
                self.isReservationOption=NO; // For the time
            }else{
                self.isReservationOption=NO;
            }
        }else{
            self.isReservationOption=NO;
        }
    }
    return self;
}

@end
