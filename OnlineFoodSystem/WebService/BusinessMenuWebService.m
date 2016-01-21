//
//  BusinessMenuWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BusinessMenuWebService.h"
#import "ModelMenuList.h"

@implementation BusinessMenuWebService

+(BusinessMenuWebService*)service
{
    static BusinessMenuWebService *businessMenuService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        businessMenuService=[[BusinessMenuWebService alloc] initWithService:ALL_BUSINESS_MENU];
    });
    return businessMenuService;
}

-(void)callBusinessMenuWebServiceForBusinessID:(NSString*)strBusinessID DeliveryType:(NSString*)deliveryType CountryID:(NSString*)strCountryID CityID:(NSString*)strCityID DeliveryNeighbourStatus:(NSString*)strDeliveryNeighbourStatus Currency:(NSString*)strCurrency GA:(NSString*)strGA CityName:(NSString*)strCityName CollectionType:(NSString*)collectionType ReserveStatus:(NSString*)reserverStatus Address:(NSString*)strAddress Resturant:(NSString*)strResturant Cusinies:(NSString*)strCusinies RHour:(NSString*)strRHour RMin:(NSString*)strRMin Latitude:(NSString*)strLatitude Longitude:(NSString*)strLongitude ZipCode:(NSString*)strZipCode Zoom:(NSString*)strZoom Approved:(BOOL)isApproved  WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        
        NSMutableDictionary *dictLocation=[NSMutableDictionary dictionary];
        [dictLocation setObject:strLatitude forKey:@"latitud"];
        [dictLocation setObject:strLongitude forKey:@"longitud"];
        [dictLocation setObject:strZipCode forKey:@"zipcode"];
        [dictLocation setObject:strZoom forKey:@"zoom"];
        
        
        NSMutableDictionary *dictWhareAll=[NSMutableDictionary dictionary];
        [dictWhareAll setObject:strCountryID forKey:@"country"];
        [dictWhareAll setObject:strCityID forKey:@"city"];
        [dictWhareAll setObject:strDeliveryNeighbourStatus forKey:@"delivery_neighborhoodStaus"];
        [dictWhareAll setObject:strCurrency forKey:@"currency"];
        [dictWhareAll setObject:strGA forKey:@"ga"];
        [dictWhareAll setObject:strCityName forKey:@"cityname"];
        [dictWhareAll setObject:collectionType forKey:@"collecttype"];
        [dictWhareAll setObject:reserverStatus forKey:@"reservestatus"];
        [dictWhareAll setObject:strAddress forKey:@"address"];
        [dictWhareAll setObject:strResturant forKey:@"resturant"];
        [dictWhareAll setObject:strCusinies forKey:@"cuisines"];
        [dictWhareAll setObject:strRHour forKey:@"rhour"];
        [dictWhareAll setObject:strRMin forKey:@"rmin"];
        [dictWhareAll setObject:[NSNumber numberWithBool:isApproved] forKey:@"approved"];
        [dictWhareAll setObject:strZipCode forKey:@"zipcode"];
        [dictWhareAll setObject:dictLocation forKey:@"location"];
        
        
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:strBusinessID forKey:@"businessid"];
        [dict setObject:deliveryType forKey:@"deliveryType"];
        [dict setObject:dictWhareAll forKey:@"whereall"];
        
        
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
                            if ([[responseDict objectForKey:@"status"] boolValue]) {
                                NSMutableArray *arrMenuList=[[responseDict objectForKey:@"menulist"] mutableCopy];
                                if (appDel.arrCategory) {
                                    appDel.arrCategory=nil;
                                }
                                appDel.arrCategory=[NSMutableArray array];
                                
                                if (appDel.arrFavouriteCategory) {
                                    appDel.arrFavouriteCategory=nil;
                                }
                                appDel.arrFavouriteCategory=[NSMutableArray array];
                                
                                for (int i=0; i<arrMenuList.count; i++) {
                                    ModelMenuList *obj=[[ModelMenuList alloc] initWithDictionary:arrMenuList[i]];
                                    [arrMenuList removeObjectAtIndex:i];
                                    if (obj) {
                                        [arrMenuList insertObject:obj atIndex:i];
                                    }
                                }
                                NSMutableArray *arrCategoryNameID=[[responseDict objectForKey:@"categorynameid"] mutableCopy];
                                
                                NSDictionary *dictResult=[NSDictionary dictionaryWithObjects:@[arrMenuList,arrCategoryNameID] forKeys:@[@"arrMenuList",@"arrCategoryNameID"]];
                                handler(dictResult,NO,@"OK");
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
