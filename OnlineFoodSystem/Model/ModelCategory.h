//
//  ModelCategory.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCategory : NSObject

@property(strong,nonatomic) NSMutableArray *arrIDS;
@property(strong,nonatomic) NSString *strName;
@property(strong,nonatomic) NSString *strID;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
