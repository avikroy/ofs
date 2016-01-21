//
//  MyOrderWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "MyOrderWebService.h"
#import "ModelMyOrder.h"

@implementation MyOrderWebService

+(MyOrderWebService*)service
{
    static MyOrderWebService *myOrderService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myOrderService=[[MyOrderWebService alloc] initWithService:MY_ORDER_SERVICE];
    });
    return myOrderService;
}

-(void)callMyOrderForUserID:(NSString*)strUserID CompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:[NSNumber numberWithInteger:[[strUserID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]] forKey:@"usr"];
        
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
                            if ([responseDict objectForKey:@"orders"] && ![[responseDict objectForKey:@"orders"] isKindOfClass:[NSNull class]]) {
                                NSMutableArray *arrResponse=[[responseDict objectForKey:@"orders"] mutableCopy];
                                if (arrResponse.count>0) {
                                    for (int i=0; i<arrResponse.count; i++) {
                                        ModelMyOrder *objOrder=[[ModelMyOrder alloc] initWithDictionary:arrResponse[i]];
                                        [arrResponse removeObjectAtIndex:i];
                                        if (objOrder) {
                                            [arrResponse insertObject:objOrder atIndex:i];
                                        }
                                    }
                                    handler(arrResponse,NO,@"OK");
                                }else{
                                    arrResponse=nil;
                                    handler([NSMutableArray array],NO,@"OK");
                                }
                            }else{
                                handler([NSMutableArray array],NO,@"OK");
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
