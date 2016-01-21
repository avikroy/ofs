//
//  ModelCategoryCustom.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCategoryCustom : NSObject

@property(strong,nonatomic) NSString *strID;
@property(strong,nonatomic) NSString *strName;
@property(assign,nonatomic) BOOL isEnable;
@property(strong,nonatomic) NSMutableArray *arrSubCategroy;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
