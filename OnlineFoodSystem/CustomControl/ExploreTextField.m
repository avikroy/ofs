//
//  ExploreTextField.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ExploreTextField.h"

@implementation ExploreTextField

-(id)init
{
    if (self=[super init]) {
        [self initializer];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        [self initializer];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self initializer];
    }
    return self;
}

-(void)initializer
{
    if ([self.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            //UIColor *color=[UIColor colorWithRed:136.0f/255.0f green:136.0f/255.0f blue:136.0f/255.0f alpha:1.0f];
            UIColor *color=[UIColor blackColor];
            self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color}];
        }
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10.0f, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [self textRectForBounds:bounds];
}

@end
