//
//  LoginWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 30/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "LoginWebService.h"
#import "ModelUser.h"

@implementation LoginWebService

+(LoginWebService*)service
{
    static LoginWebService *loginWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginWebService=[[LoginWebService alloc] initWithService:LOGIN_SERVICE];
    });
    return loginWebService;
}

-(void)callLoginServiceForEmail:(NSString*)strEmail Password:(NSString*)strPassword WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:[strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"email"];
        [dict setObject:strPassword forKey:@"pwd"];
        
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
                        NSError *errorJsonConversion=nil;
                        NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJsonConversion];
                        if (errorJsonConversion) {
                            handler(errorJsonConversion,YES,strSomethinWrongErrorMessage);
                        }else{
                            if ([[responseDict objectForKey:@"status"] boolValue]) {
                                ModelUser *user=[[ModelUser alloc] initWithDictionary:responseDict];
                                handler(user,NO,@"User login is successful.");
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
