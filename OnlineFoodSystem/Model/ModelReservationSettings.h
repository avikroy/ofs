//
//  ModelReservationSettings.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelReservationSettings : NSObject

@property(assign,nonatomic) BOOL isReservationCountry;
@property(assign,nonatomic) BOOL isReservationCity;
@property(assign,nonatomic) BOOL isReservationOption;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
