//
//  UpdateProfileWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "UpdateProfileWebService.h"

@implementation UpdateProfileWebService

+(UpdateProfileWebService*)service
{
    static UpdateProfileWebService *updateProfileService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        updateProfileService=[[UpdateProfileWebService alloc] initWithService:UPDATE_PROFILE_SERVICE];
    });
    return updateProfileService;
}

-(void)callUpdateProfileForUserID:(NSString*)strUserID Name:(NSString*)strName FirstName:(NSString*)strFirstName MiddleName:(NSString*)strMiddleName LastName:(NSString*)strLastName Email:(NSString*)strEmail Address:(NSString*)strAddress Colony:(NSString*)strColony Zip:(NSString*)strZip CityID:(NSString*)strCityID CountryID:(NSString*)strCountryID Telephone:(NSString*)strTelephone CellPhone:(NSString*)strCellPhone API:(NSString*)strAPI CompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        /*
         
         $id = 1;
         $name = 'aaa';
         $lastname = 'bb';
         $lastname2 = 'cc';
         $email = 'cbcb58@gmail.com';
         $password = '12345';
         $address = 'kolkata';
         $colony = 'sss';
         $zip = '452';
         $city = '1';
         $country = '1';
         $tel = '545415';
         $cel = '545415';
         $api = '54';
         
        */
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:[strUserID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"id"];
        [dict setObject:[NSNumber numberWithInteger:[[strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"name"];
        [dict setObject:[NSNumber numberWithInteger:[[strMiddleName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"lastname"];
        [dict setObject:[NSNumber numberWithInteger:[[strLastName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"lastname2"];
        [dict setObject:[NSNumber numberWithInteger:[[strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"email"];
        [dict setObject:[NSNumber numberWithInteger:[[strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"password"];
        
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
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setTimeoutInterval:60.0];
            [request setHTTPBody:postData];
            
            
            NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:nil delegateQueue: [NSOperationQueue mainQueue]];
            
            
            NSURLSessionDataTask *dataTask=[defaultSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error) {
                    handler(error,YES,strSomethinWrongErrorMessage);
                }else{
                    if (data.length>0) {
                        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                        [self displayResponse:data URL:[urlForService absoluteString]];
                        NSError *errorJsonConversion=nil;
                        NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJsonConversion];
                        if (errorJsonConversion) {
                            handler(errorJsonConversion,YES,strSomethinWrongErrorMessage);
                        }else{
                            
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
