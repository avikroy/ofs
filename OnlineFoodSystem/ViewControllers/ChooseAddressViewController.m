//
//  ChooseAddressViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ChooseAddressViewController.h"
#import "BusinessTypeSelectorViewController.h"
#import "GooglePlaceAutocompleWebService.h"
#import "ModelPlaceAutocomplete.h"
#import "GooglePlaceDetailsWebService.h"
#import <GoogleMaps/GoogleMaps.h>
#import "MyCustomAnnonation.h"
#import "MyCustomPinAnnotationView.h"
#import "CategoryViewController.h"
#import "GooglePlaceApproxWebService.h"
#import "CategoryViewController.h"

@import MapKit;

@interface ChooseAddressViewController ()<UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate>
{
    @private
    IBOutlet UIView *vwPicker;
    IBOutlet UITableView *tblLocation;
    IBOutlet UITextField *txtAddress;
    IBOutlet MKMapView *myMapView;
    
    CLLocationManager *locationManager;
    NSMutableArray *arrPlace;
    CLLocationCoordinate2D selectedCoordinate;
    
    MyCustomPinAnnotationView *annotationView;
    MyCustomAnnonation *annonation;
}

@end

@implementation ChooseAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapTapped:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    tapRecognizer.numberOfTouchesRequired = 1;
    
    [myMapView addGestureRecognizer:tapRecognizer];
    
    
    
    
    myMapView.delegate=self;
    
    locationManager = [[CLLocationManager alloc] init];
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization];
    }
    
    //[locationManager startUpdatingLocation];
    
    tblLocation.estimatedRowHeight=40.0f;
    tblLocation.rowHeight=UITableViewAutomaticDimension;
    
    [self displayActivityWithMessage:@"Please Wait..."];
    [[GooglePlaceApproxWebService service] callGooglePlaceApproxWebServiceWithContryName:self.appDel.objSelectedCountry.strName CityName:self.appDel.objSelectedCity.strName Address:nil WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        [self dismissActivity];
        if (isError) {
            [self displayErrorMessage:strMsg];
        }else{
            NSDictionary *dictResponse=(NSDictionary*)result;
            //dictResponse=[NSDictionary dictionaryWithObjects:@[strFormattedAddress,strPlaceID,lat,lon] forKeys:@[@"strFormattedAddress",@"strPlaceID",@"lat",@"lon"]];
            
            txtAddress.text=[dictResponse objectForKey:@"strFormattedAddress"];
            self.appDel.strSelectedAddress=txtAddress.text;
            selectedCoordinate=CLLocationCoordinate2DMake([[dictResponse objectForKey:@"lat"] doubleValue], [[dictResponse objectForKey:@"lon"] doubleValue]);
            self.appDel.coordinateSelected=selectedCoordinate;
            [self getDetailsOfSelectedLocation];
            [myMapView removeAnnotation:annonation];
            annonation=[[MyCustomAnnonation alloc] initWithTitle:@"Selected Location" Location:selectedCoordinate];
            [myMapView addAnnotation:annonation];
            
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(selectedCoordinate, 990000, 990000);
            [myMapView setRegion:[myMapView regionThatFits:region] animated:YES];
        }
    }];
}

-(void)mapTapped:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:myMapView];
    
    CLLocationCoordinate2D tapPoint = [myMapView convertPoint:point toCoordinateFromView:self.view];
    
    selectedCoordinate=tapPoint;
    [myMapView removeAnnotation:annonation];
    annonation=[[MyCustomAnnonation alloc] initWithTitle:@"Selected Location" Location:selectedCoordinate];
    [myMapView addAnnotation:annonation];
    [self getDetailsOfSelectedLocation];
}

-(void)getDetailsOfSelectedLocation
{
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:selectedCoordinate.latitude longitude:selectedCoordinate.longitude]; //insert your coordinates
    
    [ceo reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            
        }else{
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"placemark %@",placemark);
            //String to hold address
            NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
            NSLog(@"addressDictionary %@", placemark.addressDictionary);
            self.appDel.strSelectedAddress=[[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
            txtAddress.text=self.appDel.strSelectedAddress;
            NSLog(@"placemark %@",placemark.region);
            NSLog(@"placemark %@",placemark.country);  // Give Country Name
            NSLog(@"placemark %@",placemark.locality); // Extract the city name
            NSLog(@"location %@",placemark.name);
            NSLog(@"location %@",placemark.ocean);
            NSLog(@"location %@",placemark.postalCode);
            self.appDel.strSelectedZipCode=placemark.postalCode;
            NSLog(@"location %@",placemark.subLocality);
            
            NSLog(@"location %@",placemark.location);
            //Print the location to console
            NSLog(@"I am currently at %@",locatedAt);
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    tblLocation.hidden=YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    BusinessTypeSelectorViewController *master=[BusinessTypeSelectorViewController sharedInstance];
    master.view.frame=CGRectMake(0, 0, vwPicker.bounds.size.width, vwPicker.bounds.size.height);
    [vwPicker addSubview:master.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textChanged:(UITextField*)textField
{
    if ([textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        [[GooglePlaceAutocompleWebService service] callGooglePlaceAutocompleteServiceForKeyWord:[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            if (isError) {
                [self displayErrorMessage:strMsg];
            }else{
                arrPlace=(NSMutableArray*)result;
                if (arrPlace.count>0) {
                    [tblLocation reloadData];
                    if ([tblLocation isHidden]) {
                        tblLocation.hidden=NO;
                    }
                }else{
                    tblLocation.hidden=YES;
                }
            }
        }];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrPlace.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"MyCell";
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    cell.textLabel.text=[(ModelPlaceAutocomplete*)[arrPlace objectAtIndex:indexPath.row] strDescription];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tblLocation.hidden=YES;
    [txtAddress resignFirstResponder];
    ModelPlaceAutocomplete *obj=arrPlace[indexPath.row];
    txtAddress.text=[[obj.strDescription capitalizedString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (self.appDel.isRechable) {
        [self displayActivityWithMessage:@"Please Wait..."];
        [[GMSPlacesClient sharedClient] lookUpPlaceID:obj.strPlaceID callback:^(GMSPlace * _Nullable result, NSError * _Nullable error) {
            [self dismissActivity];
            if (error) {
                [self displayErrorMessage:@"Autocomplete Error"];
                NSLog(@"%@",error.localizedDescription);
            }else{
                NSLog(@"%f %f",result.coordinate.latitude,result.coordinate.longitude);
                selectedCoordinate=result.coordinate;
                [myMapView removeAnnotation:annonation];
                annonation=[[MyCustomAnnonation alloc] initWithTitle:@"Selected Location" Location:selectedCoordinate];
                [myMapView addAnnotation:annonation];
            }
        }];
    }else{
        [self displayErrorMessage:NoNetwork];
    }
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MyCustomAnnonation class]]) {
        MyCustomAnnonation *location=(MyCustomAnnonation*)annotation;
        annotationView=[[MyCustomPinAnnotationView alloc] initWithAnnotation:annotation Coordinate:location.coordinate PinType:PIN_USER_LOCATION];
        return annotationView;
    }else{
        return nil;
    }
    return nil;
}

-(IBAction)btnUseAddressPressed:(id)sender
{
    [self performSegueWithIdentifier:@"CategoryViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CategoryViewController"]) {
        CategoryViewController *master=segue.destinationViewController;
        master.strAddress=([txtAddress.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0)?[txtAddress.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]:@"";
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.appDel.coordinateSelected=selectedCoordinate;
}

@end
