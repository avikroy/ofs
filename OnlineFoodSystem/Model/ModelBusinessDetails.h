//
//  ModelBusinessDetails.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelReview.h"

@interface ModelBusinessDetails : NSObject
{
    @private
    ModelReview *_objReviews;
    NSMutableArray *_arrFranchises;
    NSNumber *_serviceFee;
}

@property(strong,nonatomic,readonly) ModelReview *objReviews;
@property(strong,nonatomic,readonly) NSMutableArray *arrFranchises;
@property(strong,nonatomic,readonly) NSNumber *serviceFee;
@end
