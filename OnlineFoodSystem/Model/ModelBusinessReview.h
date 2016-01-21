//
//  ModelBusinessReview.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelBusinessReview : NSObject
{
    @private
    NSString *_strOrderID;
    NSString *_strQuality;
    NSString *_strDelivery;
    NSString *_strDealer;
    NSString *_strPackage;
    NSString *_strPDate;
    NSString *_strEmail;
    NSString *_strComment;
    NSString *_strCity;
    NSString *_strAverage;
    NSString *_strUser;
}

@property(strong,nonatomic,readonly) NSString *strOrderID;
@property(strong,nonatomic,readonly) NSString *strQuality;
@property(strong,nonatomic,readonly) NSString *strDelivery;
@property(strong,nonatomic,readonly) NSString *strDealer;
@property(strong,nonatomic,readonly) NSString *strPackage;
@property(strong,nonatomic,readonly) NSString *strPDate;
@property(strong,nonatomic,readonly) NSString *strEmail;
@property(strong,nonatomic,readonly) NSString *strComment;
@property(strong,nonatomic,readonly) NSString *strCity;
@property(strong,nonatomic,readonly) NSString *strAverage;
@property(strong,nonatomic,readonly) NSString *strUser;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
