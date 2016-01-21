//
//  MyOrderWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface MyOrderWebService : WebServiceBaseClass

+(MyOrderWebService*)service;

-(void)callMyOrderForUserID:(NSString*)strUserID CompletionHandler:(WebServiceCompletionHandler)handler;

@end
