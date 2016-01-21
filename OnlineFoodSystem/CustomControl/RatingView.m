//
//  RatingView.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 08/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView


-(void)setRating:(NSInteger)rating
{
    vw=[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    
    img1=(UIImageView*)[vw viewWithTag:1];
    img2=(UIImageView*)[vw viewWithTag:2];
    img3=(UIImageView*)[vw viewWithTag:3];
    img4=(UIImageView*)[vw viewWithTag:4];
    img5=(UIImageView*)[vw viewWithTag:5];
    
    
    vw.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:vw];
    [self layoutIfNeeded];
    
    UIImage *imageGray=[UIImage imageNamed:@"star_grey.png"];
    UIImage *imageRed=[UIImage imageNamed:@"star_red.png"];
    switch (rating) {
        case 0:
            img1.image=imageGray;
            img2.image=imageGray;
            img3.image=imageGray;
            img4.image=imageGray;
            img5.image=imageGray;
            break;
        case 1:
            img1.image=imageRed;
            img2.image=imageGray;
            img3.image=imageGray;
            img4.image=imageGray;
            img5.image=imageGray;
            break;
        case 2:
            img1.image=imageRed;
            img2.image=imageRed;
            img3.image=imageGray;
            img4.image=imageGray;
            img5.image=imageGray;
            break;
        case 3:
            img1.image=imageRed;
            img2.image=imageRed;
            img3.image=imageRed;
            img4.image=imageGray;
            img5.image=imageGray;
            break;
        case 4:
            img1.image=imageRed;
            img2.image=imageRed;
            img3.image=imageRed;
            img4.image=imageRed;
            img5.image=imageGray;
            break;
        case 5:
            img1.image=imageRed;
            img2.image=imageRed;
            img3.image=imageRed;
            img4.image=imageRed;
            img5.image=imageRed;
            break;
        default:
            img1.image=nil;
            img2.image=nil;
            img3.image=nil;
            img4.image=nil;
            img5.image=nil;
            break;
    }
}

@end
