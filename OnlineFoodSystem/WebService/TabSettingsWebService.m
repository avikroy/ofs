//
//  TabSettingsWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 01/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "TabSettingsWebService.h"

@implementation TabSettingsWebService

+(TabSettingsWebService*)service
{
    static TabSettingsWebService *tabSettingsWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabSettingsWebService=[[TabSettingsWebService alloc] initWithService:TAB_SETTINGS];
    });
    return tabSettingsWebService;
}

-(void)callTabSettingsWebServiceWithCompletionHandler:(WebServiceCompletionHandler)handler
{
    
    if (appDel.isRechable) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:urlForService];
        NSLog(@"urlService=%@",urlForService.absoluteString);
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setTimeoutInterval:60.0];
        
        
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:nil delegateQueue: [NSOperationQueue mainQueue]];
        
        
        NSURLSessionDataTask *dataTask=[defaultSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                handler(error,YES,strSomethinWrongErrorMessage);
            }else{
                if (data.length>0) {
                    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                    NSString *strTemp=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    strTemp=[strTemp stringByReplacingOccurrencesOfString:@"<pre>" withString:@""];
                    strTemp=[strTemp stringByReplacingOccurrencesOfString:@"</pre>" withString:@""];
                    data=[strTemp dataUsingEncoding:NSUTF8StringEncoding];
                    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                    [self displayResponse:data URL:[urlForService absoluteString]];
                    NSError *errorJsonConversion=nil;
                    NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJsonConversion];
                    if (errorJsonConversion) {
                        handler(errorJsonConversion,YES,strSomethinWrongErrorMessage);
                    }else{
                        if ([responseDict objectForKey:@"settings"] && ![[responseDict objectForKey:@"settings"] isKindOfClass:[NSNull class]]) {
                            responseDict=[responseDict objectForKey:@"settings"];
                            if ([[responseDict objectForKey:@"status"] boolValue]) {
                                appDel.objTabSettings=[[ModelTabSettings alloc] initWithDictionary:[responseDict objectForKey:@"tab_settings"]];
//                                appDel.objTabSettings.isDelivery=NO;
//                                appDel.objTabSettings.isPickUp=NO;
                                appDel.objDeliverySettings=[[ModelDeliverySettings alloc] initWithDictionary:[responseDict objectForKey:@"delevery_settings"]];
                                appDel.objPickUpSettings=[[ModelPickUpSettings alloc] initWithDictionary:[responseDict objectForKey:@"pickup_settings"]];
                                appDel.objReservationSettings=[[ModelReservationSettings alloc] initWithDictionary:[responseDict objectForKey:@"reservation_settings"]];
                                handler(nil,NO,@"Everything is ok");
                            }else{
                                handler(nil,YES,strSomethinWrongErrorMessage);
                            }
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
    }else{
        handler(nil,YES,NoNetwork);
    }
}

@end
