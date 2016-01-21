//
//  ModelCity.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCity : NSObject

@property(strong,nonatomic) NSString *strID;
@property(strong,nonatomic) NSString *strName;
@property(strong,nonatomic) NSString *strCountryID;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
