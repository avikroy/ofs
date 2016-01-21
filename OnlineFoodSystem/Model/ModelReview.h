//
//  ModelReview.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelReview : NSObject

@property(strong,nonatomic) NSString *strQuality;
@property(strong,nonatomic) NSString *strDelivery;
@property(strong,nonatomic) NSString *strDealer;
@property(strong,nonatomic) NSString *strPackage;
@property(strong,nonatomic) NSString *strRating;
@property(strong,nonatomic) NSString *strTotal;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
