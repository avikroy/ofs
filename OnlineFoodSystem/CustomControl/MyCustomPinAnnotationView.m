//
//  MyCustomPinAnnotationView.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "MyCustomPinAnnotationView.h"


NSString static *strPinImage[]={
    [PIN_USER_LOCATION]=@"user_location_icon_modified.png",
    [PIN_SELECTED_LOCATION]=@"user_location_icon_modified.png",
    [PIN_BUSINESS_OPEN]=@"Opened_restaurent_icon.png",
    [PIN_BUSINESS_CLOSE]=@"closed_restaurent_icon.png",
};

@implementation MyCustomPinAnnotationView

-(id)initWithAnnotation:(id<MKAnnotation>)annotation Coordinate:(CLLocationCoordinate2D)coordinate PinType:(PIN_TYPE)pinCategory
{
    if (self=[super initWithAnnotation:annotation reuseIdentifier:nil]) {
        self.clipsToBounds=NO;
        self.coordinate=coordinate;
        self.canShowCallout=NO;
        self.rightCalloutAccessoryView=nil;
//        self.image=[UIImage imageNamed:strPinImage[pinCategory]];
        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:strPinImage[pinCategory]]];
        img.frame=CGRectMake(-20, -20, 40, 40);
        img.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:img];
    }
    return self;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    UIView* hitView = [super hitTest:point withEvent:event];
    if (hitView != nil)
    {
        [self.superview bringSubviewToFront:self];
    }
    return hitView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect rect = self.bounds;
    BOOL isInside = CGRectContainsPoint(rect, point);
    if(!isInside)
    {
        for (UIView *view in self.subviews)
        {
            isInside = CGRectContainsPoint(view.frame, point);
            if(isInside)
                break;
        }
    }
    return isInside;
}

@end
