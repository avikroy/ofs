//
//  DownloaderImageView.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 08/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "DownloaderImageView.h"

@implementation DownloaderImageView

-(id)init
{
    if (self=[super init]) {
        [self initialization];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        [self initialization];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

-(id)initWithImage:(UIImage *)image
{
    if (self=[super initWithImage:image]) {
        [self initialization];
    }
    return self;
}

-(id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    if (self=[super initWithImage:image highlightedImage:highlightedImage]) {
        [self initialization];
    }
    return self;
}

-(void)initialization
{
    activityIndicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self addSubview:activityIndicator];
    
    NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:activityIndicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraint:xCenterConstraint];
    
    NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:activityIndicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraint:yCenterConstraint];
    
    [self setBackgroundColor:[UIColor blackColor]];
    [self layoutIfNeeded];
}

-(void)downloadImageFromURLString:(NSString*)strURL Storage:(NSMutableDictionary*)dict
{
    [self layoutIfNeeded];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        if (dict) {
            if ([dict objectForKey:strURL]) {
                NSData *dataImage=[dict objectForKey:strURL];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image=[UIImage imageWithData:dataImage];
                });
            }else{
                NSData *dataImage=[NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
                if (dataImage.length>0) {
                    [dict setObject:dataImage forKey:strURL];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image=[UIImage imageWithData:dataImage];
                    });
                }
            }
        }else{
            NSData *dataImage=[NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
            if (dataImage.length>0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image=[UIImage imageWithData:dataImage];
                });
            }
        }
    });
}

@end
