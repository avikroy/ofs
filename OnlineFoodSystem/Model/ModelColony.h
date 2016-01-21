//
//  ModelColony.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelColony : NSObject

@property(strong,nonatomic) NSString *strID;
@property(strong,nonatomic) NSString *strName;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
