//
//  MyCustomPinAnnotationView.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ModelBusiness.h"

typedef NS_ENUM(NSUInteger, PIN_TYPE) {
    PIN_USER_LOCATION,
    PIN_SELECTED_LOCATION,
    PIN_BUSINESS_OPEN,
    PIN_BUSINESS_CLOSE,
};

@interface MyCustomPinAnnotationView : MKAnnotationView

@property(assign,nonatomic) CLLocationCoordinate2D coordinate;
@property(strong,nonatomic) ModelBusiness *objBusiness;

-(id)initWithAnnotation:(id<MKAnnotation>)annotation Coordinate:(CLLocationCoordinate2D)coordinate PinType:(PIN_TYPE)pinCategory;

@end
