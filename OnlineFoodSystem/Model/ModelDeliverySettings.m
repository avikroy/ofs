//
//  ModelDeliverySettings.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelDeliverySettings.h"

@implementation ModelDeliverySettings

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"tab_delivery_country"] && ![[dict objectForKey:@"tab_delivery_country"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_delivery_country"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isDeliveryCountry=YES;
            }else{
                self.isDeliveryCountry=NO;
            }
        }else{
            self.isDeliveryCountry=NO;
        }
        if ([dict objectForKey:@"tab_delivery_city"] && ![[dict objectForKey:@"tab_delivery_city"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_delivery_city"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isDeliveryCity=YES;
            }else{
                self.isDeliveryCity=NO;
            }
        }else{
            self.isDeliveryCity=NO;
        }
        if ([dict objectForKey:@"tab_delivery_address"] && ![[dict objectForKey:@"tab_delivery_address"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_delivery_address"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isDeliveryAddress=YES;
            }else{
                self.isDeliveryAddress=NO;
            }
        }else{
            self.isDeliveryAddress=NO;
        }
        if ([dict objectForKey:@"tab_delivery_neighborhood"] && ![[dict objectForKey:@"tab_delivery_neighborhood"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_delivery_neighborhood"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                self.isDeliveryNeighbourhood=YES;
            }else{
                self.isDeliveryNeighbourhood=NO;
            }
        }else{
            self.isDeliveryNeighbourhood=NO;
        }
        if ([dict objectForKey:@"tab_delivery_option"] && ![[dict objectForKey:@"tab_delivery_option"] isKindOfClass:[NSNull class]]) {
            if ([[[dict objectForKey:@"tab_delivery_option"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"t"]) {
                //self.isDeliveryOption=YES;
                self.isDeliveryOption=NO;//For the time
            }else{
                self.isDeliveryOption=NO;
            }
        }else{
            self.isDeliveryOption=NO;
        }
    }
    return self;
}

@end
