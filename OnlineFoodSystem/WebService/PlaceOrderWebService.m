//
//  PlaceOrderWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 10/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "PlaceOrderWebService.h"

@implementation PlaceOrderWebService

+(PlaceOrderWebService*)service
{
    static PlaceOrderWebService *placeOrder=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        placeOrder=[[PlaceOrderWebService alloc] initWithService:PLACE_ORDER];
    });
    return placeOrder;
}

@end
