//
//  LoginTextField.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import "LoginTextField.h"

@implementation LoginTextField

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
    self.layer.cornerRadius=5.0f;
    self.layer.borderWidth=1.5f;
    self.layer.borderColor=[UIColor colorWithRed:245.0f/255.0f green:148.0f/255.0f blue:147.0f/255.0f alpha:1.0f].CGColor;
    if ([self.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            UIColor *color=[UIColor colorWithRed:136.0f/255.0f green:136.0f/255.0f blue:136.0f/255.0f alpha:1.0f];
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
