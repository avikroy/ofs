//
//  WebServiceBaseClass.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 30/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExtendNSLogFunctionality.h"
#import "AppDelegate.h"

#define NoNetwork @"No network connection, please try again later."

typedef NS_ENUM(NSUInteger, WEB_SERVICE_TYPE) {
    LOGIN_SERVICE,
    REGISTRATION_SERVICE,
    COUNTRY_SERVICE,
    CITY_SERVICE,
    COLONY_SERVICE,
    ALL_USER_SERVICE,
    USER_BY_ID_SERVICE,
    ALL_BUSINESS_SERVICE,
    ALL_BUSINESS_MENU,
    BUSINESS_INFO,
    BUSINESS_DISCOUNT_OFFER,
    BUSINESS_REVIEW,
    TAB_SETTINGS,
    PRODUCT_OPTION_SERVICE,
    GUEST_CHECKOUT_SERVICE,
    PLACE_ORDER,
    MY_ORDER_SERVICE,
    FORGET_PASSWORD_SERVICE,
    UPDATE_PROFILE_SERVICE,
    GET_PROFILE_SERVICE,
    UPLOAD_PHOTO_SERVICE,
};

typedef void(^WebServiceCompletionHandler)(id result,BOOL isError,NSString *strMsg);

@interface WebServiceBaseClass : NSObject
{
    @protected
    NSURL *urlForService;
    NSString *strSomethinWrongErrorMessage;
    AppDelegate *appDel;
    NSString *strBaseUrl;
}

-(id)initWithService:(WEB_SERVICE_TYPE)service;

-(void)displayResponse:(NSData*)data URL:(NSString*)strURL;

@end
