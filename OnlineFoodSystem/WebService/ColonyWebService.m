//
//  ColonyWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ColonyWebService.h"
#import "ModelColony.h"

@implementation ColonyWebService

+(ColonyWebService*)service
{
    static ColonyWebService *colonyWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colonyWebService=[[ColonyWebService alloc] initWithService:CITY_SERVICE];
    });
    return colonyWebService;
}

-(void)callColonyServiceForCityID:(NSString*)strCityID WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:[strCityID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"city"];
        
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
                                if ([responseDict objectForKey:@"colony"] && ![[responseDict objectForKey:@"colony"] isKindOfClass:[NSNull class]]) {
                                    NSMutableArray *arrColony=[[responseDict objectForKey:@"colony"] mutableCopy];
                                    for (int i=0; i<arrColony.count; i++) {
                                        ModelColony *objColony=[[ModelColony alloc] initWithDictionary:arrColony[i]];
                                        if (objColony) {
                                            [arrColony removeObjectAtIndex:i];
                                            [arrColony insertObject:objColony atIndex:i];
                                        }else{
                                            handler(nil,YES,strSomethinWrongErrorMessage);
                                        }
                                    }
                                    handler(arrColony,NO,@"OK");
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
        }
    }else{
        handler(nil,YES,NoNetwork);
    }
}

@end
