//
//  GooglePlaceApprox.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "GooglePlaceApproxWebService.h"

@implementation GooglePlaceApproxWebService

+(GooglePlaceApproxWebService*)service
{
    static GooglePlaceApproxWebService *googlePlaceApprox=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        googlePlaceApprox=[[GooglePlaceApproxWebService alloc] init];
    });
    return googlePlaceApprox;
}

-(void)callGooglePlaceApproxWebServiceWithContryName:(NSString*)strCountryName CityName:(NSString*)strCityName Address:(NSString*)strAddress WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    NSString *strQuery=@"";
    if (strCountryName && [strCountryName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        strQuery=[strQuery stringByAppendingString:strCountryName];
    }
    if (strCityName && [strCityName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        if (strQuery.length>0) {
            strQuery=[strQuery stringByAppendingString:[NSString stringWithFormat:@"+%@",strCityName]];
        }else{
            strQuery=[strQuery stringByAppendingString:strCityName];
        }
    }
    if (strAddress && [strAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        if (strQuery.length>0) {
            strQuery=[strQuery stringByAppendingString:[NSString stringWithFormat:@"+%@",strAddress]];
        }else{
            strQuery=[strQuery stringByAppendingString:strAddress];
        }
    }
    
    
    
    NSString *strUrlToCall=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=%@&key=AIzaSyArYWLsN9mnWnLFV4dJjI1B7Dn6Nkd9ZPU",strQuery];
    urlForService=[NSURL URLWithString:[strUrlToCall stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
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
                    if ([[[[dictResponse objectForKey:@"status"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"OK"]) {
                        dictResponse=[(NSArray*)[dictResponse objectForKey:@"results"] objectAtIndex:0];
                        NSString *strFormattedAddress=[dictResponse objectForKey:@"formatted_address"];
                        NSString *strPlaceID=[dictResponse objectForKey:@"place_id"];
                        dictResponse=[(NSDictionary*)[dictResponse objectForKey:@"geometry"] objectForKey:@"location"];
                        NSNumber *lat=[NSNumber numberWithDouble:[[dictResponse objectForKey:@"lat"] doubleValue]];
                        NSNumber *lon=[NSNumber numberWithDouble:[[dictResponse objectForKey:@"lng"] doubleValue]];
                        dictResponse=nil;
                        dictResponse=[NSDictionary dictionaryWithObjects:@[strFormattedAddress,strPlaceID,lat,lon] forKeys:@[@"strFormattedAddress",@"strPlaceID",@"lat",@"lon"]];
                        handler(dictResponse,NO,@"OK");
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
