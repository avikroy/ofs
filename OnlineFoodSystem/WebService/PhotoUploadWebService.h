//
//  PhotoUploadWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface PhotoUploadWebService : WebServiceBaseClass

+(PhotoUploadWebService*)service;

-(void)callPhotoUploadWebServiceForUserID:(NSString*)strUserID Image:(NSData*)imgData CompletionHandler:(WebServiceCompletionHandler)handler;


@end
