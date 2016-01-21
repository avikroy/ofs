//
//  BusinessMenuWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import "BusinessTypeSelectorViewController.h"


@interface BusinessMenuWebService : WebServiceBaseClass

+(BusinessMenuWebService*)service;

-(void)callBusinessMenuWebServiceForBusinessID:(NSString*)strBusinessID DeliveryType:(NSString*)deliveryType CountryID:(NSString*)strCountryID CityID:(NSString*)strCityID DeliveryNeighbourStatus:(NSString*)strDeliveryNeighbourStatus Currency:(NSString*)strCurrency GA:(NSString*)strGA CityName:(NSString*)strCityName CollectionType:(NSString*)collectionType ReserveStatus:(NSString*)reserverStatus Address:(NSString*)strAddress Resturant:(NSString*)strResturant Cusinies:(NSString*)strCusinies RHour:(NSString*)strRHour RMin:(NSString*)strRMin Latitude:(NSString*)strLatitude Longitude:(NSString*)strLongitude ZipCode:(NSString*)strZipCode Zoom:(NSString*)strZoom Approved:(BOOL)isApproved  WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
