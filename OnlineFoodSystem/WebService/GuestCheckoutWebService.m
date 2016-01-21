//
//  GuestCheckoutWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 05/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "GuestCheckoutWebService.h"
#import "ModelGuestCheckout.h"

@implementation GuestCheckoutWebService

+(GuestCheckoutWebService*)service
{
    static GuestCheckoutWebService *guestCheckoutService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guestCheckoutService = [[GuestCheckoutWebService alloc] initWithService:GUEST_CHECKOUT_SERVICE];
    });
    return guestCheckoutService;
}

-(void)callGuestCheckoutWebServiceWithCompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:urlForService];
        NSLog(@"urlService=%@",urlForService.absoluteString);
        [request setHTTPMethod:@"GET"];
        [request setTimeoutInterval:60.0];
        
        
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
                        if ([responseDict objectForKey:@"status"] && [[responseDict objectForKey:@"status"] boolValue]) {
                            if ([responseDict objectForKey:@"checkout"] && ![[responseDict objectForKey:@"checkout"] isKindOfClass:[NSNull class]]){
                                responseDict=[responseDict objectForKey:@"checkout"];
                                if (responseDict.count>0) {
                                    NSMutableArray *arrResponse=[NSMutableArray array];
                                    for (NSString *strKey in responseDict) {
                                        ModelGuestCheckout *objGuest=[[ModelGuestCheckout alloc] initWithDictionary:(NSDictionary*)responseDict[strKey]];
                                        if (objGuest) {
                                            [arrResponse addObject:objGuest];
                                        }
                                    }
                                    handler(arrResponse,NO,@"OK");
                                }else{
                                    handler(nil,YES,strSomethinWrongErrorMessage);
                                }
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
