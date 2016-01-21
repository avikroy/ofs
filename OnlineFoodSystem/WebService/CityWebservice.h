//
//  CityWebservice.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface CityWebservice : WebServiceBaseClass

+(CityWebservice*)service;

-(void)callCityServiceForCountryID:(NSString*)strCountryID WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
