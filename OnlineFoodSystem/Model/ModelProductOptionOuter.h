//
//  ModelProductOptionOuter.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 16/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProductOptionInner.h"

@interface ModelProductOptionOuter : NSObject
{
    @private
    NSString *_strID;
    NSString *_strName;
    NSMutableArray *_arrOption;
}

@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strName;
@property(strong,nonatomic,readonly) NSMutableArray *arrOption;

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end
