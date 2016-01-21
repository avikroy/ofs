//
//  FacebookLoginWebService.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 05/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "FacebookLoginWebService.h"
#import "AppDelegate.h"
@import FBSDKCoreKit;
@import FBSDKLoginKit;

@implementation FacebookLoginWebService

+(FacebookLoginWebService*)service
{
    static FacebookLoginWebService *fbLoginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fbLoginService=[[FacebookLoginWebService alloc] init];
    });
    return fbLoginService;
}

-(void)loginUsingFBProfile:(void(^)(id result,BOOL isError,NSString *strMsg))handler FromViewController:(UIViewController*)controller
{
    AppDelegate *appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    if (appDel.isRechable) {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        if ([FBSDKAccessToken currentAccessToken]) {
            
            
            FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                          initWithGraphPath:@"/me?fields=id,name,email"
                                          parameters:nil
                                          HTTPMethod:@"GET"];
            [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                                  id result,
                                                  NSError *error) {
                if (error) {
                    handler(nil,YES,@"Something is wrong, please try again later.");
                }else{
                    handler((NSDictionary*)result,NO,nil);
                }
            }];
        }else{
            
            
            [login logInWithReadPermissions:@[@"email",@"public_profile",@"user_friends"] fromViewController:controller handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                if (error) {
                    // Process error
                } else if (result.isCancelled) {
                    //Process canceled
                } else {
                    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                                  initWithGraphPath:@"/me?fields=id,name,email,birthday"
                                                  parameters:nil
                                                  HTTPMethod:@"GET"];
                    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                                          id result,
                                                          NSError *error) {
                        if (error) {
                            handler(error,YES,@"Something is wrong, please try again later.");
                        }else{
                            handler((NSDictionary*)result,NO,nil);
                        }
                    }];
                }
            }];
        }
    }else{
        handler(nil,YES,@"No Network");
    }
}

@end
