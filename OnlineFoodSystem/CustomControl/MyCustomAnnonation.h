//
//  MyCustomAnnonation.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ModelBusiness.h"

@interface MyCustomAnnonation : NSObject<MKAnnotation>

@property(nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property(copy,nonatomic) NSString *title;
@property(strong,nonatomic) ModelBusiness *objBusiness;

-(id)initWithTitle:(NSString*)newTitle Location:(CLLocationCoordinate2D)location;
-(MKAnnotationView*)annonationView;

@end
