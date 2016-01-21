//
//  AllBusinessService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import "BusinessTypeSelectorViewController.h"

@interface AllBusinessWebService : WebServiceBaseClass

+(AllBusinessWebService*)service;

-(void)callAllBusinessWebServiceForLatitude:(NSString*)strLatitude Longitude:(NSString*)strLongitude ZipCode:(NSString*)strZipCode Zoom:(NSString*)strZoom BusinessType:(NSString*)businessType Category:(NSString*)strCategory SelectedCityID:(NSString*)strSelectedCityID Filter:(BOOL)filetr SelectedCountryID:(NSString*)strCountryID DeliveryNeighbourhoodStatus:(NSInteger)deliveryNeighbourhoodStatus Currency:(NSString*)strCurrency GA:(NSString*)strGA CityName:(NSString*)strCityName CollectType:(NSString*)collectType Reservations:(NSString*)reservation Address:(NSString*)strAddress Approved:(BOOL)approved Resturent:(NSString*)strResturant Cuisines:(NSString*)strCuisinies RHour:(NSString*)strRHour RMin:(NSString*)strRMin WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
