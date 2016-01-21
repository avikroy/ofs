//
//  ModelInnerOption.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 16/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelProductOptionInner.h"

@implementation ModelProductOptionInner

@synthesize strConditional=_strConditional,strID=_strID,strIngredients=_strIngredients,strMaxSel=_strMaxSel,strMinSel=_strMinSel,strName=_strName,strRank=_strRank,arrChoices=_arrChoices;

-(instancetype)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            _strID=[dict objectForKey:@"id"];
        }else{
            _strID=@"";
        }
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            _strName=[dict objectForKey:@"name"];
        }else{
            _strName=@"";
        }
        if ([dict objectForKey:@"maxsel"] && ![[dict objectForKey:@"maxsel"] isKindOfClass:[NSNull class]]) {
            _strMaxSel=[dict objectForKey:@"maxsel"];
        }else{
            _strMaxSel=@"";
        }
        if ([dict objectForKey:@"minsel"] && ![[dict objectForKey:@"minsel"] isKindOfClass:[NSNull class]]) {
            _strMinSel=[dict objectForKey:@"minsel"];
        }else{
            _strMinSel=@"";
        }
        if ([dict objectForKey:@"rank"] && ![[dict objectForKey:@"rank"] isKindOfClass:[NSNull class]]) {
            _strRank=[dict objectForKey:@"rank"];
        }else{
            _strRank=@"";
        }
        if ([dict objectForKey:@"conditional"] && ![[dict objectForKey:@"conditional"] isKindOfClass:[NSNull class]]) {
            _strConditional=[dict objectForKey:@"conditional"];
        }else{
            _strConditional=@"";
        }
        if ([dict objectForKey:@"ingredients"] && ![[dict objectForKey:@"ingredients"] isKindOfClass:[NSNull class]]) {
            _strIngredients=[dict objectForKey:@"ingredients"];
        }else{
            _strIngredients=@"";
        }
        if ([dict objectForKey:@"choices"] && ![[dict objectForKey:@"choices"] isKindOfClass:[NSNull class]]) {
            _arrChoices=[[dict objectForKey:@"choices"] mutableCopy];
            if (_arrChoices.count>0) {
                for (int i=0; i<_arrChoices.count; i++) {
                    ModelChoice *objChoices=[[ModelChoice alloc] initWithDictionary:_arrChoices[i]];
                    [_arrChoices removeObjectAtIndex:i];
                    if (objChoices) {
                        [_arrChoices insertObject:objChoices atIndex:i];
                    }
                }
            }
        }else{
            _arrChoices=[NSMutableArray array];
        }
        self.choiceCount=0;
    }
    return self;
}

@end
