//
//  UpdateProfileWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface UpdateProfileWebService : WebServiceBaseClass

+(UpdateProfileWebService*)service;

-(void)callUpdateProfileForUserID:(NSString*)strUserID Name:(NSString*)strName FirstName:(NSString*)strFirstName MiddleName:(NSString*)strMiddleName LastName:(NSString*)strLastName Email:(NSString*)strEmail Address:(NSString*)strAddress Colony:(NSString*)strColony Zip:(NSString*)strZip CityID:(NSString*)strCityID CountryID:(NSString*)strCountryID Telephone:(NSString*)strTelephone CellPhone:(NSString*)strCellPhone API:(NSString*)strAPI CompletionHandler:(WebServiceCompletionHandler)handler;

@end
