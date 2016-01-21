//
//  ModelDishes.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelDishes.h"

@implementation ModelDishes
@synthesize strID=_strID;
@synthesize strName=_strName;
@synthesize strPrice=_strPrice;
@synthesize strCategoryID=_strCategoryID;
@synthesize strCategoryName=_strCategoryName;
@synthesize strRankCat=_strRankCat;
@synthesize strISIMG=_strISIMG;
@synthesize strISIMG2=_strISIMG2;
@synthesize strISIMG3=_strISIMG3;
@synthesize strdescription=_strdescription;
@synthesize strFeatures=_strFeatures;
@synthesize strPoints=_strPoints;
@synthesize strSellerWineLibary=_strSellerWineLibary;
@synthesize strOriginLibray=_strOriginLibray;
@synthesize strAllDishSets=_strAllDishSets;

-(id)initWithDictionary:(NSDictionary*)dict
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
        if ([dict objectForKey:@"ingredients"] && ![[dict objectForKey:@"ingredients"] isKindOfClass:[NSNull class]]) {
            _arrIngredients=[[NSJSONSerialization JSONObjectWithData:[[dict objectForKey:@"ingredients"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil] mutableCopy];
        }else{
            _arrIngredients=[NSMutableArray array];
        }
        if ([dict objectForKey:@"price"] && ![[dict objectForKey:@"price"] isKindOfClass:[NSNull class]]) {
            _strPrice=[dict objectForKey:@"price"];
        }else{
            _strPrice=@"";
        }
        if ([dict objectForKey:@"extras"] && ![[dict objectForKey:@"extras"] isKindOfClass:[NSNull class]]) {
            _arrExtras=[[NSJSONSerialization JSONObjectWithData:[[dict objectForKey:@"extras"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil] mutableCopy];
        }else{
            _arrExtras=[NSMutableArray array];
        }
        if ([dict objectForKey:@"category"] && ![[dict objectForKey:@"category"] isKindOfClass:[NSNull class]]) {
            _strCategoryID=[dict objectForKey:@"category"];
        }else{
            _strCategoryID=@"";
        }
        if ([dict objectForKey:@"catname"] && ![[dict objectForKey:@"catname"] isKindOfClass:[NSNull class]]) {
            _strCategoryName=[dict objectForKey:@"catname"];
        }else{
            _strCategoryName=@"";
        }
        if ([dict objectForKey:@"rank_cat"] && ![[dict objectForKey:@"rank_cat"] isKindOfClass:[NSNull class]]) {
            _strRankCat=[dict objectForKey:@"rank_cat"];
        }else{
            _strRankCat=@"";
        }
        if ([dict objectForKey:@"isimg"] && ![[dict objectForKey:@"isimg"] isKindOfClass:[NSNull class]]) {
            _strISIMG=[dict objectForKey:@"isimg"];
        }else{
            _strISIMG=@"";
        }
        if ([dict objectForKey:@"isimg2"] && ![[dict objectForKey:@"isimg2"] isKindOfClass:[NSNull class]]) {
            _strISIMG2=[dict objectForKey:@"isimg2"];
        }else{
            _strISIMG2=@"";
        }
        if ([dict objectForKey:@"isimg3"] && ![[dict objectForKey:@"isimg3"] isKindOfClass:[NSNull class]]) {
            _strISIMG3=[dict objectForKey:@"isimg3"];
        }else{
            _strISIMG3=@"";
        }
        if ([dict objectForKey:@"description"] && ![[dict objectForKey:@"description"] isKindOfClass:[NSNull class]]) {
            _strdescription=[dict objectForKey:@"description"];
        }else{
            _strdescription=@"";
        }
        if ([dict objectForKey:@"feature"] && ![[dict objectForKey:@"feature"] isKindOfClass:[NSNull class]]) {
            _strFeatures=[dict objectForKey:@"feature"];
        }else{
            _strFeatures=@"";
        }
        if ([dict objectForKey:@"points"] && ![[dict objectForKey:@"points"] isKindOfClass:[NSNull class]]) {
            _strPoints=[dict objectForKey:@"points"];
        }else{
            _strPoints=@"";
        }
        if ([dict objectForKey:@"seller_winelibary"] && ![[dict objectForKey:@"seller_winelibary"] isKindOfClass:[NSNull class]]) {
            _strSellerWineLibary=[dict objectForKey:@"seller_winelibary"];
        }else{
            _strSellerWineLibary=@"";
        }
        if ([dict objectForKey:@"origin_winelibary"] && ![[dict objectForKey:@"origin_winelibary"] isKindOfClass:[NSNull class]]) {
            _strOriginLibray=[dict objectForKey:@"origin_winelibary"];
        }else{
            _strOriginLibray=@"";
        }
        if ([dict objectForKey:@"Alldishsets"] && ![[dict objectForKey:@"Alldishsets"] isKindOfClass:[NSNull class]]) {
            _strAllDishSets=[NSString stringWithFormat:@"%ld",[[dict objectForKey:@"Alldishsets"] integerValue]];
        }else{
            _strAllDishSets=@"0";
        }
    }
    return self;
}

@end
