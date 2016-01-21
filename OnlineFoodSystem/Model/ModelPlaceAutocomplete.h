//
//  ModelPlaceAutocomplete.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelPlaceAutocomplete : NSObject

@property(strong,nonatomic) NSString *strDescription;
@property(strong,nonatomic) NSString *strPlaceID;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
