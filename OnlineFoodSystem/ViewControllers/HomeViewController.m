//
//  LandingViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import "HomeViewController.h"
#import "SignInViewController.h"
#import "TabSettingsWebService.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadTabSettings:^(BOOL completed) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark IBAction
#pragma mark

-(IBAction)btnExplorePressed:(id)sender
{
    
}

-(IBAction)btnSignInPressed:(id)sender
{
    [self performSegueWithIdentifier:@"SignInViewController" sender:self];
}

-(IBAction)btnSignUpPressed:(id)sender
{
    
}

#pragma mark
#pragma mark Segue Parametr Passing
#pragma mark

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SignInViewController"]) {
        //SignInViewController *master=segue.destinationViewController;
    }
}

-(void)loadTabSettings:(void(^)(BOOL completed))completion
{
    
    if ([self isNetworkRechable]) {
        [self displayActivityWithMessage:@"Please Wait"];
        [[TabSettingsWebService service] callTabSettingsWebServiceWithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            [self dismissActivity];
            if (isError) {
                UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [alertController dismissViewControllerAnimated:YES completion:^{
                        
                    }];
                }];
                [alertController addAction:actionOK];
                
                [self presentViewController:alertController animated:YES completion:^{
                    
                }];
                
            }else{
                if (self.appDel.objTabSettings) {
                    
                    self.appDel.arrBusinessType=[NSMutableArray array];
                    self.appDel.arrDelivery=[NSMutableArray array];
                    self.appDel.arrPickUp=[NSMutableArray array];
                    self.appDel.arrReservation=[NSMutableArray array];
                    
                    if (self.appDel.objTabSettings.isDelivery) {
                        [self.appDel.arrBusinessType addObject:@"Delivery"];
                        
                        if (self.appDel.objDeliverySettings.isDeliveryCountry) {
                            [self.appDel.arrDelivery addObject:@"Country"];
                        }
                        if (self.appDel.objDeliverySettings.isDeliveryCity) {
                            [self.appDel.arrDelivery addObject:@"City"];
                        }
                        if (self.appDel.objDeliverySettings.isDeliveryAddress) {
                            [self.appDel.arrDelivery addObject:@"Address"];
                        }
                        if (self.appDel.objDeliverySettings.isDeliveryNeighbourhood) {
                            //[self.appDel.arrDelivery addObject:@"Neighbourhood"];
                            if (![self.appDel.arrDelivery containsObject:@"Address"]) {
                                [self.appDel.arrDelivery addObject:@"Address"];
                            }
                        }
                        if (self.appDel.objDeliverySettings.isDeliveryOption) {
                            [self.appDel.arrDelivery addObject:@"Option"];
                        }
                    }
                    
                    if (self.appDel.objTabSettings.isPickUp) {
                        [self.appDel.arrBusinessType addObject:@"Pickup"];
                        
                        if (self.appDel.objPickUpSettings.isPickUpCountry) {
                            [self.appDel.arrPickUp addObject:@"Country"];
                        }
                        if (self.appDel.objPickUpSettings.isPickUpCity) {
                            [self.appDel.arrPickUp addObject:@"City"];
                        }
                        if (self.appDel.objPickUpSettings.isPickUpOption) {
                            //[self.appDel.arrPickUp addObject:@"Option"];
                            [self.appDel.arrPickUp addObject:@"Address"];
                        }
                    }
                    
                    if (self.appDel.objTabSettings.isReservation) {
                        [self.appDel.arrBusinessType addObject:@"Reservation"];
                        
                        if (self.appDel.objReservationSettings.isReservationCountry) {
                            [self.appDel.arrReservation addObject:@"Country"];
                        }
                        if (self.appDel.objReservationSettings.isReservationCity) {
                            [self.appDel.arrReservation addObject:@"City"];
                        }
                        if (self.appDel.objReservationSettings.isReservationOption) {
                            //[self.appDel.arrReservation addObject:@"Option"];
                            [self.appDel.arrReservation addObject:@"Address"];
                        }
                    }
                    
                }else{
                    self.appDel.arrBusinessType=[NSMutableArray array];
                    self.appDel.arrDelivery=[NSMutableArray array];
                    self.appDel.arrPickUp=[NSMutableArray array];
                    self.appDel.arrReservation=[NSMutableArray array];
                }
            }
        }];
    }else{
        [self displayErrorMessage:@"Network is not rechable, please try again later..."];
    }
    
    
}

@end
