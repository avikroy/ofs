//
//  GuestCheckoutWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 05/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GuestCheckoutWebService : WebServiceBaseClass

+(GuestCheckoutWebService*)service;

-(void)callGuestCheckoutWebServiceWithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
