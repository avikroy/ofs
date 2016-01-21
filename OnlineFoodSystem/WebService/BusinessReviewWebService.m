//
//  BusinessReviewWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BusinessReviewWebService.h"
#import "ModelBusinessReview.h"

@implementation BusinessReviewWebService

+(BusinessReviewWebService*)service
{
    static BusinessReviewWebService *businessReviewWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        businessReviewWebService=[[BusinessReviewWebService alloc] initWithService:BUSINESS_REVIEW];
    });
    return businessReviewWebService;
}

-(void)callBusinessInfoWebServiceForBusinessID:(NSString*)strBusinessID WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:strBusinessID forKey:@"businessid"];
        
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
                            if ([responseDict objectForKey:@"status"] && [[responseDict objectForKey:@"status"] boolValue]) {
                                NSMutableArray *arrResponse=[[responseDict objectForKey:@"BusinessReview"] mutableCopy];
                                if (arrResponse && arrResponse.count>0) {
                                    for (int i=0; i<arrResponse.count; i++) {
                                        ModelBusinessReview *objReview=[[ModelBusinessReview alloc] initWithDictionary:[arrResponse objectAtIndex:i]];
                                        [arrResponse removeObjectAtIndex:i];
                                        [arrResponse insertObject:objReview atIndex:i];
                                    }
                                    handler(arrResponse,NO,@"OK");
                                }else{
                                    handler([NSMutableArray array],NO,@"OK");
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
        }
    }else{
        handler(nil,YES,NoNetwork);
    }
}

@end
