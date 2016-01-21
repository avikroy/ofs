//
//  GooglePlaceAutocompleWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "GooglePlaceAutocompleWebService.h"
#import "ModelPlaceAutocomplete.h"

@implementation GooglePlaceAutocompleWebService

+(GooglePlaceAutocompleWebService*)service
{
    static GooglePlaceAutocompleWebService *googlePlaceAutocompleteService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        googlePlaceAutocompleteService=[[GooglePlaceAutocompleWebService alloc] init];
    });
    return googlePlaceAutocompleteService;
}

-(void)callGooglePlaceAutocompleteServiceForKeyWord:(NSString*)strKeyWord WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    /*
    if (appDel.isRechable) {
        NSString *strUrlToCall=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&key=AIzaSyArYWLsN9mnWnLFV4dJjI1B7Dn6Nkd9ZPU",strKeyWord];
        urlForService=[NSURL URLWithString:strUrlToCall];
        
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
                    NSError *errorJson=nil;
                    NSDictionary *dictResponse=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJson];
                    if (errorJson) {
                        handler(errorJson,YES,strSomethinWrongErrorMessage);
                    }else{
                        if ([dictResponse objectForKey:@"status"] && ![[dictResponse objectForKey:@"status"] isKindOfClass:[NSNull class]]) {
                            if ([[[[dictResponse objectForKey:@"status"] uppercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"OK"]) {
                                NSMutableArray *arrPrediction=[[dictResponse objectForKey:@"predictions"] mutableCopy];
                                for (int i=0; i<arrPrediction.count; i++) {
                                    ModelPlaceAutocomplete *obj=[[ModelPlaceAutocomplete alloc] initWithDictionary:arrPrediction[i]];
                                    if (obj) {
                                        [arrPrediction removeObjectAtIndex:i];
                                        [arrPrediction insertObject:obj atIndex:i];
                                    }
                                }
                                handler(arrPrediction,NO,@"OK");
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
    }*/
    
    NSString *strUrlToCall=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&key=AIzaSyArYWLsN9mnWnLFV4dJjI1B7Dn6Nkd9ZPU",strKeyWord];
    urlForService=[NSURL URLWithString:strUrlToCall];
    
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
                NSError *errorJson=nil;
                NSDictionary *dictResponse=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJson];
                if (errorJson) {
                    handler(errorJson,YES,strSomethinWrongErrorMessage);
                }else{
                    if ([dictResponse objectForKey:@"status"] && ![[dictResponse objectForKey:@"status"] isKindOfClass:[NSNull class]]) {
                        if ([[[[dictResponse objectForKey:@"status"] uppercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"OK"]) {
                            NSMutableArray *arrPrediction=[[dictResponse objectForKey:@"predictions"] mutableCopy];
                            for (int i=0; i<arrPrediction.count; i++) {
                                ModelPlaceAutocomplete *obj=[[ModelPlaceAutocomplete alloc] initWithDictionary:arrPrediction[i]];
                                if (obj) {
                                    [arrPrediction removeObjectAtIndex:i];
                                    [arrPrediction insertObject:obj atIndex:i];
                                }
                            }
                            handler(arrPrediction,NO,@"OK");
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

@end
