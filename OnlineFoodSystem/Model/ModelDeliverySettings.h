//
//  ModelDeliverySettings.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelDeliverySettings : NSObject

@property(assign,nonatomic) BOOL isDeliveryCountry;
@property(assign,nonatomic) BOOL isDeliveryCity;
@property(assign,nonatomic) BOOL isDeliveryAddress;
@property(assign,nonatomic) BOOL isDeliveryNeighbourhood;
@property(assign,nonatomic) BOOL isDeliveryOption;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
