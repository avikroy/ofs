//
//  CountryWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface CountryWebService : WebServiceBaseClass

+(CountryWebService*)service;

-(void)callCountryServiceWithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
