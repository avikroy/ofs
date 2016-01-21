//
//  ColonyWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface ColonyWebService : WebServiceBaseClass

+(ColonyWebService*)service;

-(void)callColonyServiceForCityID:(NSString*)strCityID WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
