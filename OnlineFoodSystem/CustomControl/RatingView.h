//
//  RatingView.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 08/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingView : UIView
{
    @private
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    IBOutlet UIImageView *img4;
    IBOutlet UIImageView *img5;
    IBOutlet UIView *vw;
}

@property(assign,nonatomic)NSInteger rating;

-(void)setRating:(NSInteger)rating;

@end
