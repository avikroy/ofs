//
//  ModelDishes.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelDishes : NSObject
{
    @private
    NSString *_strID;
    NSString *_strName;
    NSString *_strPrice;
    NSString *_strCategoryID;
    NSString *_strCategoryName;
    NSString *_strRankCat;
    NSString *_strISIMG;
    NSString *_strISIMG2;
    NSString *_strISIMG3;
    NSString *_strdescription;
    NSString *_strFeatures;
    NSString *_strPoints;
    NSString *_strSellerWineLibary;
    NSString *_strOriginLibray;
    NSString *_strAllDishSets;
    
    NSMutableArray *_arrIngredients;
    NSMutableArray *_arrExtras;
}


@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strName;
@property(strong,nonatomic,readonly) NSString *strPrice;
@property(strong,nonatomic,readonly) NSString *strCategoryID;
@property(strong,nonatomic,readonly) NSString *strCategoryName;
@property(strong,nonatomic,readonly) NSString *strRankCat;
@property(strong,nonatomic,readonly) NSString *strISIMG;
@property(strong,nonatomic,readonly) NSString *strISIMG2;
@property(strong,nonatomic,readonly) NSString *strISIMG3;
@property(strong,nonatomic,readonly) NSString *strdescription;
@property(strong,nonatomic,readonly) NSString *strFeatures;
@property(strong,nonatomic,readonly) NSString *strPoints;
@property(strong,nonatomic,readonly) NSString *strSellerWineLibary;
@property(strong,nonatomic,readonly) NSString *strOriginLibray;
@property(strong,nonatomic,readonly) NSString *strAllDishSets;

@property(strong,nonatomic,readonly) NSMutableArray *arrIngredients;
@property(strong,nonatomic,readonly) NSMutableArray *arrExtras;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
