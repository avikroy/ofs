//
//  ModelUser.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 30/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelUser : NSObject

@property(strong,nonatomic,nullable) NSString *strId;
@property(strong,nonatomic,nullable) NSString *strName;
@property(strong,nonatomic,nullable) NSString *strLastName;
@property(strong,nonatomic,nullable) NSString *strLastName2;
@property(strong,nonatomic,nullable) NSString *strEmail;
@property(strong,nonatomic,nullable) NSString *strPassword;
@property(strong,nonatomic,nullable) NSString *strAddress;
@property(strong,nonatomic,nullable) NSString *strColony;
@property(strong,nonatomic,nullable) NSString *strZIP;
@property(strong,nonatomic,nullable) NSString *strCountry;
@property(strong,nonatomic,nullable) NSString *strCity;
@property(strong,nonatomic,nullable) NSString *strCityName;
@property(strong,nonatomic,nullable) NSString *strTelephone;
@property(strong,nonatomic,nullable) NSString *strCellPhone;
@property(strong,nonatomic,nullable) NSString *strOccupation;
@property(assign,nonatomic) BOOL status;

-(id _Nullable)initWithDictionary:(NSDictionary * _Nullable)dict;

@end
