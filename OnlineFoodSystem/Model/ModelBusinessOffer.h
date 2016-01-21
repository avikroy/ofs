//
//  ModelBusinessOffer.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelBusinessOffer : NSObject
{
    @private
    NSString *_strRate;
    NSString *_strMinShop;
    NSString *_strStartDate;
    NSString *_strEndDate;
    NSString *_strValidDays;
    NSString *_strCreateDate;
    NSString *_strDiscountText;
    BOOL _accept;
    NSString *_strBusiness;
}

@property(strong,nonatomic,readonly) NSString *strRate;
@property(strong,nonatomic,readonly) NSString *strMinShop;
@property(strong,nonatomic,readonly) NSString *strStartDate;
@property(strong,nonatomic,readonly) NSString *strEndDate;
@property(strong,nonatomic,readonly) NSString *strValidDays;
@property(strong,nonatomic,readonly) NSString *strCreateDate;
@property(strong,nonatomic,readonly) NSString *strDiscountText;
@property(assign,nonatomic,readonly,getter=isAccept) BOOL accept;
@property(strong,nonatomic,readonly) NSString *strBusiness;


-(id)initWithDictionary:(NSDictionary*)dict;


@end
