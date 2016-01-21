//
//  BusinessInfoWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface BusinessInfoWebService : WebServiceBaseClass

+(BusinessInfoWebService*)service;

-(void)callBusinessInfoWebServiceForBusinessID:(NSString*)strBusinessID WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
