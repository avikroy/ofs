//
//  AllBusinessService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "AllBusinessWebService.h"
#import "ModelBusiness.h"
#import "ModelCategory.h"
#import "ModelCategoryCustom.h"

@implementation AllBusinessWebService

+(AllBusinessWebService*)service
{
    static AllBusinessWebService *allBusinessService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allBusinessService=[[AllBusinessWebService alloc] initWithService:ALL_BUSINESS_SERVICE];
    });
    return allBusinessService;
}

-(void)callAllBusinessWebServiceForLatitude:(NSString*)strLatitude Longitude:(NSString*)strLongitude ZipCode:(NSString*)strZipCode Zoom:(NSString*)strZoom BusinessType:(NSString*)businessType Category:(NSString*)strCategory SelectedCityID:(NSString*)strSelectedCityID Filter:(BOOL)filetr SelectedCountryID:(NSString*)strCountryID DeliveryNeighbourhoodStatus:(NSInteger)deliveryNeighbourhoodStatus Currency:(NSString*)strCurrency GA:(NSString*)strGA CityName:(NSString*)strCityName CollectType:(NSString*)collectType Reservations:(NSString*)reservation Address:(NSString*)strAddress Approved:(BOOL)approved Resturent:(NSString*)strResturant Cuisines:(NSString*)strCuisinies RHour:(NSString*)strRHour RMin:(NSString*)strRMin WithCompletionHandler:(WebServiceCompletionHandler)handler
{
    if (appDel.isRechable) {
        
        NSMutableDictionary *dictLocation=[NSMutableDictionary dictionary];
        [dictLocation setObject:[NSNumber numberWithDouble:[strLatitude doubleValue]] forKey:@"latitud"];
        [dictLocation setObject:[NSNumber numberWithDouble:[strLongitude doubleValue]] forKey:@"longitud"];
        [dictLocation setObject:strZipCode forKey:@"zipcode"];
        [dictLocation setObject:strZoom forKey:@"zoom"];
        NSError *error=nil;
        NSData *dataLocation=[NSJSONSerialization dataWithJSONObject:dictLocation options:NSJSONWritingPrettyPrinted error:&error];
        NSString *strLocation;
        if (error) {
            handler(error,YES,strSomethinWrongErrorMessage);
            return;
        }else{
            strLocation=[[NSString alloc] initWithData:dataLocation encoding:NSUTF8StringEncoding];
        }
        
        NSString *strDelivertType=businessType;
        
        NSMutableDictionary *dictWhereAll=[NSMutableDictionary dictionary];
        [dictWhereAll setObject:strCountryID forKey:@"country"];
        [dictWhereAll setObject:strSelectedCityID forKey:@"city"];
        [dictWhereAll setObject:[NSNumber numberWithInteger:deliveryNeighbourhoodStatus] forKey:@"delivery_neighborhoodStaus"];
        [dictWhereAll setObject:strCurrency forKey:@"currency"];
        [dictWhereAll setObject:strGA forKey:@"ga"];
        [dictWhereAll setObject:strCityName forKey:@"cityname"];
        NSString *strCollectType=collectType;
        [dictWhereAll setObject:strCollectType forKey:@"collecttype"];
        NSString *strReserveStatus=reservation;
        [dictWhereAll setObject:strReserveStatus forKey:@"reservestatus"];
        [dictWhereAll setObject:strAddress forKey:@"address"];
        [dictWhereAll setObject:strResturant forKey:@"resturant"];
        [dictWhereAll setObject:strCuisinies forKey:@"cuisines"];
        [dictWhereAll setObject:[NSNumber numberWithInteger:[strRHour integerValue]] forKey:@"rhour"];
        [dictWhereAll setObject:[NSNumber numberWithInteger:[strRMin integerValue]] forKey:@"rmin"];
        [dictWhereAll setObject:strLocation forKey:@"location"];
        [dictWhereAll setObject:[NSNumber numberWithBool:approved] forKey:@"approved"];
        [dictWhereAll setObject:strZipCode forKey:@"zipcode"];
        
        NSData *dataWhereAll=[NSJSONSerialization dataWithJSONObject:dictWhereAll options:NSJSONWritingPrettyPrinted error:&error];
        NSString *strWhereAll;
        if (error) {
            handler(error,YES,strSomethinWrongErrorMessage);
            return;
        }else{
            strWhereAll=[[NSString alloc] initWithData:dataWhereAll encoding:NSUTF8StringEncoding];
        }
        
        
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:strLocation forKey:@"location"];
        [dict setObject:strDelivertType forKey:@"deliveryType"];
        [dict setObject:strCategory forKey:@"category"];
        [dict setObject:strSelectedCityID forKey:@"city"];
        [dict setObject:[NSNumber numberWithBool:filetr] forKey:@"filters"];
        [dict setObject:strWhereAll forKey:@"whereall"];
        
        
        
        NSError *errorConversion;
        NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&errorConversion];
        if (errorConversion) {
            handler(errorConversion,YES,@"Something is wrong, please try again later...");
        }else{
            NSLog(@"post param=%@",[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
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
                            if ([responseDict objectForKey:@"status"] && ![[responseDict objectForKey:@"status"] isKindOfClass:[NSNull class]]) {
                                if ([[responseDict objectForKey:@"status"] boolValue]) {
                                    
                                    NSMutableArray *arrBusiness;
                                    NSMutableArray *arrcategory;
                                    NSMutableArray *arrCategoryCustom;
                                    
                                    if ([responseDict objectForKey:@"business"] && ![[responseDict objectForKey:@"business"] isKindOfClass:[NSNull class]]) {
                                        arrBusiness=[[responseDict objectForKey:@"business"] mutableCopy];
                                        for (int i=0; i<arrBusiness.count; i++) {
                                            ModelBusiness *objBusiness=[[ModelBusiness alloc] initWithDictionary:arrBusiness[i] BaseURL:strBaseUrl];
                                            if (objBusiness) {
                                                [arrBusiness removeObjectAtIndex:i];
                                                [arrBusiness insertObject:objBusiness atIndex:i];
                                            }else{
                                                [arrBusiness removeObjectAtIndex:i];
                                            }
                                        }
                                    }else{
                                        arrBusiness=[NSMutableArray array];
                                    }
                                    if ([responseDict objectForKey:@"categories"] && ![[responseDict objectForKey:@"categories"] isKindOfClass:[NSNull class]]) {
                                        arrcategory=[[responseDict objectForKey:@"categories"] mutableCopy];
                                        for (int i=0; i<arrcategory.count; i++) {
                                            ModelCategory *objCategory=[[ModelCategory alloc] initWithDictionary:arrcategory[i]];
                                            if (objCategory) {
                                                [arrcategory removeObjectAtIndex:i];
                                                [arrcategory insertObject:objCategory atIndex:i];
                                            }else{
                                                [arrcategory removeObjectAtIndex:i];
                                            }
                                        }
                                    }else{
                                        arrcategory=[NSMutableArray array];
                                    }
                                    
                                    if ([responseDict objectForKey:@"categoriesCustom"] && ![[responseDict objectForKey:@"categoriesCustom"] isKindOfClass:[NSNull class]]) {
                                        arrCategoryCustom=[[responseDict objectForKey:@"categoriesCustom"] mutableCopy];
                                        for (int i=0; i<arrCategoryCustom.count; i++) {
                                            ModelCategoryCustom *objCategoryCustom=[[ModelCategoryCustom alloc] initWithDictionary:arrCategoryCustom[i]];
                                            if (objCategoryCustom) {
                                                [arrCategoryCustom removeObjectAtIndex:i];
                                                [arrCategoryCustom insertObject:objCategoryCustom atIndex:i];
                                            }else{
                                                [arrCategoryCustom removeObjectAtIndex:i];
                                            }
                                        }
                                    }else{
                                        arrCategoryCustom=[NSMutableArray array];
                                    }
                                    
                                    handler([NSDictionary dictionaryWithObjects:@[arrcategory,arrCategoryCustom,arrBusiness] forKeys:@[@"categories",@"categoriesCustom",@"business"]],NO,@"OK");
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
