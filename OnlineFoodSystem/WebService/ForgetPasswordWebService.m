//
//  ForgetPasswordWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "ForgetPasswordWebService.h"

@implementation ForgetPasswordWebService

+(ForgetPasswordWebService*)service
{
    static ForgetPasswordWebService *forgetWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        forgetWebService=[[ForgetPasswordWebService alloc] initWithService:FORGET_PASSWORD_SERVICE];
    });
    return forgetWebService;
}

-(void)callForgetPasswordServiceForEmail:(NSString*)strEmail ForCompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:[NSNumber numberWithInteger:[[strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"email"];
        
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
