//
//  WebServiceBaseClass.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 30/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"


#define BASE_URL @"http://beta.orderingonlinesystem.com/"
#define BASE_PATH @"iosapp/"


static NSString const *strServiceAPI[]={
    [LOGIN_SERVICE]             =       @"login.php",
    [REGISTRATION_SERVICE]      =       @"register.php",
    [COUNTRY_SERVICE]           =       @"country.php",
    [CITY_SERVICE]              =       @"city.php",
    [COLONY_SERVICE]            =       @"colony.php",
    [ALL_USER_SERVICE]          =       @"allusers.php",
    [USER_BY_ID_SERVICE]        =       @"userbyid.php",
    [ALL_BUSINESS_SERVICE]      =       @"allbusiness.php",
    [ALL_BUSINESS_MENU]         =       @"fetchallbusinessmenu.php",
    [BUSINESS_INFO]             =       @"businessinfo.php",
    [BUSINESS_DISCOUNT_OFFER]   =       @"businessdiscountoffer.php",
    [BUSINESS_REVIEW]           =       @"businessreview.php",
    [TAB_SETTINGS]              =       @"tabsettings.php",
    [PRODUCT_OPTION_SERVICE]    =       @"productoption.php",
    [GUEST_CHECKOUT_SERVICE]    =       @"checkoutinfo.php",
    [PLACE_ORDER]               =       @"placeorder.php",
    [MY_ORDER_SERVICE]          =       @"myorder.php",
    [FORGET_PASSWORD_SERVICE]   =       @"forgotpassword.php",
    [UPDATE_PROFILE_SERVICE]    =       @"updateuserbyid.php",
    [GET_PROFILE_SERVICE]       =       @"userbyid.php",
    [UPLOAD_PHOTO_SERVICE]      =       @"photoupload.php",
};


@implementation WebServiceBaseClass

-(id)initWithService:(WEB_SERVICE_TYPE)service
{
    if (self=[super init]) {
        urlForService=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",BASE_URL,BASE_PATH,strServiceAPI[service]]];
        strSomethinWrongErrorMessage=@"Something is wrong, please try again later.";
        appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
        strBaseUrl=BASE_URL;
    }
    return self;
}

-(void)displayResponse:(NSData*)data URL:(NSString*)strURL
{
    [[[UIAlertView alloc] initWithTitle:strURL message:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
