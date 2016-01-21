//
//  BusinessInfoWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BusinessInfoWebService.h"
#import "ModelCatalogMenu.h"
#import "ModelPhotoGallery.h"
#import "ModelVideoGallery.h"

@implementation BusinessInfoWebService

+(BusinessInfoWebService*)service
{
    static BusinessInfoWebService *businessWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        businessWebService=[[BusinessInfoWebService alloc] initWithService:BUSINESS_INFO];
    });
    return businessWebService;
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
                            if ([[responseDict objectForKey:@"status"] boolValue]) {
                                
                                NSMutableArray *arrCatalogMenu=[NSMutableArray array];
                                NSMutableArray *arrPhotogallery=[NSMutableArray array];
                                NSMutableArray *arrVideoGallery=[NSMutableArray array];
                                
                                
                                if ([responseDict objectForKey:@"catalogMenu"] && ![[responseDict objectForKey:@"catalogMenu"] isKindOfClass:[NSNull class]]) {
                                    NSMutableArray *arrTempCatalog=[responseDict objectForKey:@"catalogMenu"];
                                    for (NSDictionary *dictCatalogMenu in arrTempCatalog) {
                                        NSMutableArray *arrDays=[[[[dictCatalogMenu objectForKey:@"days"] stringByReplacingOccurrencesOfString:@"[]" withString:@""] componentsSeparatedByString:@","] mutableCopy];
                                        for (NSString *strDay in arrDays) {
                                            [arrCatalogMenu addObject:[[ModelCatalogMenu alloc] initWithDictionary:dictCatalogMenu Days:[strDay integerValue]]];
                                        }
                                    }
                                }
                                if ([responseDict objectForKey:@"Photogallery"] && ![[responseDict objectForKey:@"Photogallery"] isKindOfClass:[NSNull class]]) {
                                    arrPhotogallery=[[responseDict objectForKey:@"Photogallery"] mutableCopy];
                                    for (int i=0; i<arrPhotogallery.count; i++) {
                                        ModelPhotoGallery *objPhotoGallery=[[ModelPhotoGallery alloc] initWithDictionary:[arrPhotogallery objectAtIndex:i]];
                                        [arrPhotogallery removeObjectAtIndex:i];
                                        [arrPhotogallery insertObject:objPhotoGallery atIndex:i];
                                    }
                                }
                                
                                if ([responseDict objectForKey:@"videogallery"] && ![[responseDict objectForKey:@"videogallery"] isKindOfClass:[NSNull class]]) {
                                    arrVideoGallery=[[responseDict objectForKey:@"videogallery"] mutableCopy];
                                    for (int i=0; i<arrVideoGallery.count; i++) {
                                        ModelVideoGallery *objVideoGallery=[[ModelVideoGallery alloc] initWithDictionary:[arrVideoGallery objectAtIndex:i]];
                                        [arrVideoGallery removeObjectAtIndex:i];
                                        [arrVideoGallery insertObject:objVideoGallery atIndex:i];
                                    }
                                }
                                
//                                NSLog(@"%@",arrCatalogMenu);
//                                NSLog(@"%@",arrPhotogallery);
//                                NSLog(@"%@",arrVideoGallery);
                                
                                handler([NSDictionary dictionaryWithObjects:@[arrCatalogMenu,arrPhotogallery,arrVideoGallery] forKeys:@[@"arrCatalogMenu",@"arrPhotogallery",@"arrVideoGallery"]],NO,@"OK");
                                
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
