//
//  CategoryMapViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CategoryMapViewController.h"
#import <MapKit/MapKit.h>
#import "ModelBusiness.h"
#import "MyCustomAnnonation.h"
#import "MyCustomPinAnnotationView.h"
#import "CustomAnnotationCallOut.h"

@interface CategoryMapViewController ()<MKMapViewDelegate>
{
    @private
    IBOutlet MKMapView *myMapView;
    
    NSMutableArray *arrDisplay;
    CustomAnnotationCallOut *callOut;
}

@end

@implementation CategoryMapViewController

+(CategoryMapViewController*)sharedInstance
{
    static CategoryMapViewController *controller=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller=[[CategoryMapViewController alloc] initWithNibName:@"CategoryMapViewController" bundle:nil];
    });
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(businessValueReceived:) name:@"BusinessValueReceived" object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    myMapView.delegate=self;
}

-(void)businessValueReceived:(NSNotification*)notification
{
    arrDisplay=[self.delegate getMapDataSource:self];
    [myMapView removeAnnotations:myMapView.annotations];
    for (ModelBusiness *objBusiness in arrDisplay) {
        MyCustomAnnonation *annonation=[[MyCustomAnnonation alloc] initWithTitle:objBusiness.strName Location:objBusiness.coordinate];
        annonation.objBusiness=objBusiness;
        [myMapView addAnnotation:annonation];
    }
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        MyCustomAnnonation *location=(MyCustomAnnonation*)annotation;
        MyCustomPinAnnotationView *annotationView=[[MyCustomPinAnnotationView alloc] initWithAnnotation:annotation Coordinate:location.coordinate PinType:PIN_USER_LOCATION];
        return annotationView;
    }
    else if ([annotation isKindOfClass:[MyCustomAnnonation class]]) {
        MyCustomAnnonation *location=(MyCustomAnnonation*)annotation;
        MyCustomPinAnnotationView *annotationView=[[MyCustomPinAnnotationView alloc] initWithAnnotation:annotation Coordinate:location.coordinate PinType:(location.objBusiness.isOpen)?PIN_BUSINESS_OPEN:PIN_BUSINESS_CLOSE];
        annotationView.objBusiness=location.objBusiness;
        return annotationView;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MyCustomAnnonation *annonation=[[MyCustomAnnonation alloc] initWithTitle:@"I am here" Location:userLocation.coordinate];
    [myMapView addAnnotation:annonation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
    [myMapView setRegion:[myMapView regionThatFits:region] animated:YES];
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (callOut) {
        [callOut removeFromSuperview];
        callOut=nil;
    }
    MyCustomPinAnnotationView *annotationView=(MyCustomPinAnnotationView*)view;
    callOut=[[CustomAnnotationCallOut alloc] initWithFrame:CGRectMake(0, 0, 250, 150)];
    
    callOut.lblName.text=[annotationView.objBusiness.strName capitalizedString];
    [callOut.vwRating setRating:[annotationView.objBusiness.objReview.strTotal integerValue]];
    callOut.lblRatings.text=[NSString stringWithFormat:@"(%@ Ratings)",annotationView.objBusiness.objReview.strTotal];
    callOut.lblAddress.text=annotationView.objBusiness.strStreet;
    callOut.lblDistance.text=[NSString stringWithFormat:@"Distance: %ld",(long)annotationView.objBusiness.distance];
    [callOut.vwPaymentSupport setPayment:annotationView.objBusiness.objPaymentDetails];
    [callOut.vwPaymentSupport refresh];
    
    
    
    [view addSubview:callOut];
    callOut.center=CGPointMake(0, -100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
