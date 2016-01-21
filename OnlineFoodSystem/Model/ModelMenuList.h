//
//  ModelMenuList.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 13/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelMenuList : NSObject
{
    @private
    NSString *_strID;
    NSString *_strOpenTime;
    NSString *_strCloseTime;
    NSString *_strWeekends;
    NSMutableArray *_arrDishes;
}


@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strOpenTime;
@property(strong,nonatomic,readonly) NSString *strCloseTime;
@property(strong,nonatomic,readonly) NSString *strWeekends;
@property(strong,nonatomic,readonly) NSMutableArray *arrDishes;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
