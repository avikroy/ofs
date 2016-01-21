//
//  ModelReview.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelReview.h"

@implementation ModelReview

-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self=[super init]) {
        if ([dict objectForKey:@"quality"] && ![[dict objectForKey:@"quality"] isKindOfClass:[NSNull class]]) {
            self.strQuality=[dict objectForKey:@"quality"];
        }else{
            self.strQuality=@"";
        }
        if ([dict objectForKey:@"delivery"] && ![[dict objectForKey:@"delivery"] isKindOfClass:[NSNull class]]) {
            self.strDelivery=[dict objectForKey:@"delivery"];
        }else{
            self.strDelivery=@"";
        }
        if ([dict objectForKey:@"dealer"] && ![[dict objectForKey:@"dealer"] isKindOfClass:[NSNull class]]) {
            self.strDealer=[dict objectForKey:@"dealer"];
        }else{
            self.strDealer=@"";
        }
        if ([dict objectForKey:@"package"] && ![[dict objectForKey:@"package"] isKindOfClass:[NSNull class]]) {
            self.strPackage=[dict objectForKey:@"package"];
        }else{
            self.strPackage=@"";
        }
        if ([dict objectForKey:@"rating"] && ![[dict objectForKey:@"rating"] isKindOfClass:[NSNull class]]) {
            self.strRating=[dict objectForKey:@"rating"];
        }else{
            self.strRating=@"";
        }
        if ([dict objectForKey:@"total"] && ![[dict objectForKey:@"total"] isKindOfClass:[NSNull class]]) {
            self.strTotal=[NSString stringWithFormat:@"%ld",[[dict objectForKey:@"total"] integerValue]];
        }else{
            self.strQuality=@"0";
        }
    }
    return self;
}

@end
