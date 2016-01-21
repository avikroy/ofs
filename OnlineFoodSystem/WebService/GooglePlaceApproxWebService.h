//
//  GooglePlaceApprox.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GooglePlaceApproxWebService : WebServiceBaseClass

+(GooglePlaceApproxWebService*)service;

-(void)callGooglePlaceApproxWebServiceWithContryName:(NSString*)strCountryName CityName:(NSString*)strCityName Address:(NSString*)strAddress WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
