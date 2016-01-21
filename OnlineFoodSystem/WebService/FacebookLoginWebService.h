//
//  FacebookLoginWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 05/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface FacebookLoginWebService : NSObject

+(FacebookLoginWebService*)service;

-(void)loginUsingFBProfile:(void(^)(id result,BOOL isError,NSString *strMsg))handler FromViewController:(UIViewController*)controller;

@end
