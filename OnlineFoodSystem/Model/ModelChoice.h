//
//  ModelChoice.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 16/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelChoice : NSObject
{
    @private
    NSString *_strID;
    NSString *_strName;
    NSString *_strPrice;
}

@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strName;
@property(strong,nonatomic,readonly) NSString *strPrice;
@property(assign,nonatomic,getter=isSelected) BOOL selected;

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end
