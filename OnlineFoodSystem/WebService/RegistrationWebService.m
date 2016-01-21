//
//  RegistrationWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "RegistrationWebService.h"

@implementation RegistrationWebService

+(RegistrationWebService*)service
{
    static RegistrationWebService *registrationService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        registrationService=[[RegistrationWebService alloc] initWithService:REGISTRATION_SERVICE];
    });
    return registrationService;
}

-(void)callRegistrationServiceForName:(NSString*)strName LastName:(NSString*)strLastName LastName2:(NSString*)strLastName2 Email:(NSString*)strEmail Password:(NSString*)strPassword Address:(NSString*)strAddress Colony:(NSString*)strColony ZIP:(NSString*)strZip Country:(NSString*)strCountry City:(NSString*)strCity Telephone:(NSString*)strTelephone CellPhone:(NSString*)strCellPhone API:(NSString*)strAPI WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        
        [dict setObject:[strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"name"];
        [dict setObject:[strLastName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"lastname"];
        [dict setObject:[strLastName2 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"lastname2"];
        [dict setObject:[strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"email"];
        [dict setObject:strPassword forKey:@"password"];
        [dict setObject:[strAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"address"];
        [dict setObject:[strColony stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"colony"];
        [dict setObject:[strZip stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"zip"];
        [dict setObject:[strCountry stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"country"];
        [dict setObject:[strCity stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"city"];
        [dict setObject:[strTelephone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"tel"];
        [dict setObject:[strCellPhone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"cel"];
        [dict setObject:[strAPI stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"api"];
        
        NSLog(@"post param=%@",dict);
        
        NSError *errorConversion;
        NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&errorConversion];
        if (errorConversion) {
            handler(errorConversion,YES,@"Something is wrong, please try again later...");
        }else{
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
            [request setURL:urlForService];
            NSLog(@"urlService=%@",urlForService.absoluteString);
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request setTimeoutInterval:60.0];
            [request setHTTPBody:postData];
            
            NSURLSessionConfiguration *sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *defaultSession=[NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
            
            NSURLSessionDataTask *dataTask=[defaultSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error) {
                    handler(error,YES,strSomethinWrongErrorMessage);
                }else{
                    if (data.length>0) {
                        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                        NSError *errorJsonConversion=nil;
                        NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJsonConversion];
                        if (errorJsonConversion) {
                            handler(errorJsonConversion,YES,strSomethinWrongErrorMessage);
                        }else{
                            if ([[responseDict objectForKey:@"status"] boolValue]) {
                                
                            }else{
                                handler(nil,YES,strSomethinWrongErrorMessage);
                            }
                        }
                    }else{
                        handler(nil,YES,strSomethinWrongErrorMessage);
                    }
                }
            }];
            [dataTask resume];
        }
    }else{
        handler(nil,YES,NoNetwork);
    }
}

@end
