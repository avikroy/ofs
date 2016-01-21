//
//  ModelFranchise.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelFranchise : NSObject
{
    @private
    NSString *_strID;
    NSString *_strCity;
    NSString *_strEmail;
    NSString *_strGA;
    NSString *_strCurrency;
    NSString *_strTax;
    NSString *_strTaxType;
}

@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strCity;
@property(strong,nonatomic,readonly) NSString *strEmail;
@property(strong,nonatomic,readonly) NSString *strGA;
@property(strong,nonatomic,readonly) NSString *strCurrency;
@property(strong,nonatomic,readonly) NSString *strTax;
@property(strong,nonatomic,readonly) NSString *strTaxType;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
