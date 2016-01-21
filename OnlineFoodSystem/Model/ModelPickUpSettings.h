//
//  ModelPickUpSettings.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 02/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelPickUpSettings : NSObject

@property(assign,nonatomic) BOOL isPickUpCountry;
@property(assign,nonatomic) BOOL isPickUpCity;
@property(assign,nonatomic) BOOL isPickUpOption;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
