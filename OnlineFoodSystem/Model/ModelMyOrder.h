//
//  ModelMyOrder.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelMyOrder : NSObject
{
    @private
    NSString *_strID;
    NSString *_strDate;
    NSString *_strStatus;
    NSString *_strCityID;
    NSString *_strCity;
    NSString *_strBusinessName;
    NSString *_strStatusText;
    NSDictionary *_dictData;
}
@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strDate;
@property(strong,nonatomic,readonly) NSString *strStatus;
@property(strong,nonatomic,readonly) NSString *strCityID;
@property(strong,nonatomic,readonly) NSString *strCity;
@property(strong,nonatomic,readonly) NSString *strBusinessName;
@property(strong,nonatomic,readonly) NSString *strStatusText;
@property(strong,nonatomic,readonly) NSDictionary *dictData;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
