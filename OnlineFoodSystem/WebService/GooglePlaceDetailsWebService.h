//
//  GooglePlaceDetailsWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GooglePlaceDetailsWebService : WebServiceBaseClass

+(GooglePlaceDetailsWebService*)service;

-(void)callGooglePlaceDetailsWebServiceForPlaceID:(NSString*)strPlaceID WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
