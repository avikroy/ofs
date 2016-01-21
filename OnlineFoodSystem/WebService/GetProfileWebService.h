//
//  GetProfileWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetProfileWebService : WebServiceBaseClass

+(GetProfileWebService*)service;

-(void)callGetProfileWebServiceForUserName:(NSString*)strUserID ForCompletionHandler:(WebServiceCompletionHandler)handler;

@end
