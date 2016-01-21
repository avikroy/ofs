//
//  TabSettingsWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 01/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface TabSettingsWebService : WebServiceBaseClass

+(TabSettingsWebService*)service;

-(void)callTabSettingsWebServiceWithCompletionHandler:(WebServiceCompletionHandler)handler;


@end
