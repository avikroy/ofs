//
//  ModelUser.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 30/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelUser.h"

@implementation ModelUser

-(id _Nullable)initWithDictionary:(NSDictionary * _Nullable)dict
{
    if (self=[super init]) {
        
        if ([dict objectForKey:@"status"] && ![[dict objectForKey:@"status"] isKindOfClass:[NSNull class]]) {
            self.status=[[dict objectForKey:@"status"] boolValue];
        }else{
            self.status=NO;
        }
        
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            self.strId=[dict objectForKey:@"id"];
        }else{
            self.strId=@"";
        }
        
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            self.strName=[dict objectForKey:@"name"];
        }else{
            self.strName=@"";
        }
        
        if ([dict objectForKey:@"lastname"] && ![[dict objectForKey:@"lastname"] isKindOfClass:[NSNull class]]) {
            self.strLastName=[dict objectForKey:@"lastname"];
        }else{
            self.strLastName=@"";
        }
        
        if ([dict objectForKey:@"lastname2"] && ![[dict objectForKey:@"lastname2"] isKindOfClass:[NSNull class]]) {
            self.strLastName2=[dict objectForKey:@"lastname2"];
        }else{
            self.strLastName2=@"";
        }
        
        if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]]) {
            self.strEmail=[dict objectForKey:@"email"];
        }else{
            self.strEmail=@"";
        }
        
        if ([dict objectForKey:@"password"] && ![[dict objectForKey:@"password"] isKindOfClass:[NSNull class]]) {
            self.strPassword=[dict objectForKey:@"password"];
        }else{
            self.strPassword=@"";
        }
        
        if ([dict objectForKey:@"address"] && ![[dict objectForKey:@"address"] isKindOfClass:[NSNull class]]) {
            self.strAddress=[dict objectForKey:@"address"];
        }else{
            self.strAddress=@"";
        }
        
        if ([dict objectForKey:@"colony"] && ![[dict objectForKey:@"colony"] isKindOfClass:[NSNull class]]) {
            self.strColony=[dict objectForKey:@"colony"];
        }else{
            self.strColony=@"";
        }
        
        if ([dict objectForKey:@"zip"] && ![[dict objectForKey:@"zip"] isKindOfClass:[NSNull class]]) {
            self.strZIP=[dict objectForKey:@"zip"];
        }else{
            self.strZIP=@"";
        }
        
        if ([dict objectForKey:@"country"] && ![[dict objectForKey:@"country"] isKindOfClass:[NSNull class]]) {
            self.strCountry=[dict objectForKey:@"country"];
        }else{
            self.strCountry=@"";
        }
        
        if ([dict objectForKey:@"city"] && ![[dict objectForKey:@"city"] isKindOfClass:[NSNull class]]) {
            self.strCity=[dict objectForKey:@"city"];
        }else{
            self.strCity=@"";
        }
        
        if ([dict objectForKey:@"cityname"] && ![[dict objectForKey:@"cityname"] isKindOfClass:[NSNull class]]) {
            self.strCityName=[dict objectForKey:@"cityname"];
        }else{
            self.strCityName=@"";
        }
        
        if ([dict objectForKey:@"tel"] && ![[dict objectForKey:@"tel"] isKindOfClass:[NSNull class]]) {
            self.strTelephone=[dict objectForKey:@"tel"];
        }else{
            self.strTelephone=@"";
        }
        
        if ([dict objectForKey:@"cel"] && ![[dict objectForKey:@"cel"] isKindOfClass:[NSNull class]]) {
            self.strCellPhone=[dict objectForKey:@"cel"];
        }else{
            self.strCellPhone=@"";
        }
        
        if ([dict objectForKey:@"occupation"] && ![[dict objectForKey:@"occupation"] isKindOfClass:[NSNull class]]) {
            self.strOccupation=[dict objectForKey:@"occupation"];
        }else{
            self.strOccupation=@"";
        }
    }
    return self;
}

@end
