//
//  MyCustomAnnonation.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "MyCustomAnnonation.h"

@implementation MyCustomAnnonation

-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location
{
    if (self=[super init]) {
        _title=newTitle;
        _coordinate=location;
    }
    return self;
}

-(MKAnnotationView*)annonationView
{
    MKAnnotationView *annonationView=[[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyCustomAnnonation"];
    annonationView.enabled=YES;
    annonationView.canShowCallout=YES;
    annonationView.image=[UIImage imageNamed:@"user_location_icon_modified.png"];
    return annonationView;
}

@end
