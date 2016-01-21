//
//  GooglePlaceAutocompleWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GooglePlaceAutocompleWebService : WebServiceBaseClass

+(GooglePlaceAutocompleWebService*)service;

-(void)callGooglePlaceAutocompleteServiceForKeyWord:(NSString*)strKeyWord WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
