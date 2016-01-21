//
//  ModelTabSettings.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTabSettings : NSObject

@property(assign,nonatomic) BOOL isDelivery;
@property(assign,nonatomic) BOOL isPickUp;
@property(assign,nonatomic) BOOL isReservation;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
