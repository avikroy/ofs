//
//  LoginWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 30/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface LoginWebService : WebServiceBaseClass

+(LoginWebService*)service;

-(void)callLoginServiceForEmail:(NSString*)strEmail Password:(NSString*)strPassword WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
