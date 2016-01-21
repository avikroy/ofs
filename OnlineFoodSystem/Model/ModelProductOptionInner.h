//
//  ModelInnerOption.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 16/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelChoice.h"

@interface ModelProductOptionInner : NSObject
{
    @private
    NSString *_strID;
    NSString *_strName;
    NSString *_strMaxSel;
    NSString *_strMinSel;
    NSString *_strRank;
    NSString *_strConditional;
    NSString *_strIngredients;
    NSMutableArray *_arrChoices;
}

@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strName;
@property(strong,nonatomic,readonly) NSString *strMaxSel;
@property(strong,nonatomic,readonly) NSString *strMinSel;
@property(strong,nonatomic,readonly) NSString *strRank;
@property(strong,nonatomic,readonly) NSString *strConditional;
@property(strong,nonatomic,readonly) NSString *strIngredients;
@property(strong,nonatomic,readonly) NSMutableArray *arrChoices;
@property(assign,nonatomic) NSInteger choiceCount;

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end
