//
//  ForgetPasswordWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface ForgetPasswordWebService : WebServiceBaseClass

+(ForgetPasswordWebService*)service;

-(void)callForgetPasswordServiceForEmail:(NSString*)strEmail ForCompletionHandler:(WebServiceCompletionHandler)handler;

@end
