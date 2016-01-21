//
//  RegistrationWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface RegistrationWebService : WebServiceBaseClass

+(RegistrationWebService*)service;

-(void)callRegistrationServiceForName:(NSString*)strName LastName:(NSString*)strLastName LastName2:(NSString*)strLastName2 Email:(NSString*)strEmail Password:(NSString*)strPassword Address:(NSString*)strAddress Colony:(NSString*)strColony ZIP:(NSString*)strZip Country:(NSString*)strCountry City:(NSString*)strCity Telephone:(NSString*)strTelephone CellPhone:(NSString*)strCellPhone API:(NSString*)strAPI WithCompletionHandler:(WebServiceCompletionHandler)handler;

@end
