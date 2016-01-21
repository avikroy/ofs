//
//  ProductOptionWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 15/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ProductOptionWebService.h"


@implementation ProductOptionWebService

+(ProductOptionWebService*)service
{
    static ProductOptionWebService *productOptionWebService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        productOptionWebService=[[ProductOptionWebService alloc] initWithService:PRODUCT_OPTION_SERVICE];
    });
    return productOptionWebService;
}

-(void)callProductOptionWebServiceWithExtrasID:(NSArray*)arrExtrasID DishID:(NSString*)strDishID CompletionHandler:(WebServiceCompletionHandler)handler
{
    
    if (appDel.isRechable) {
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:arrExtrasID forKey:@"extras_id"];
        [dict setObject:strDishID forKey:@"dish_id"];
        
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
                                NSString *strIngredients=nil;
                                if ([responseDict objectForKey:@"ingredients"] && ![[responseDict objectForKey:@"ingredients"] isKindOfClass:[NSNull class]]) {
                                    strIngredients=[responseDict objectForKey:@"ingredients"];
                                }else{
                                    strIngredients=@"";
                                }
                                NSMutableArray *arrOuterOption;
                                if ([responseDict objectForKey:@"options"] && ![[responseDict objectForKey:@"options"] isKindOfClass:[NSNull class]]) {
                                    arrOuterOption=[[responseDict objectForKey:@"options"] mutableCopy];
                                    for (int i=0; i<arrOuterOption.count; i++) {
                                        ModelProductOptionOuter *objOuter=[[ModelProductOptionOuter alloc] initWithDictionary:arrOuterOption[i]];
                                        [arrOuterOption removeObjectAtIndex:i];
                                        [arrOuterOption insertObject:objOuter atIndex:i];
                                    }
                                }else{
                                    arrOuterOption=[NSMutableArray array];
                                }
                                handler(arrOuterOption,NO,@"OK");
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
