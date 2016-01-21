//
//  CustomAcitivityViewController.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAcitivityViewController : UIViewController

+(CustomAcitivityViewController*)sharedInstance;

-(void)displaActivityWithString:(NSString*)strMsg Completion:(void(^)(BOOL success))handler;
-(void)dismiss:(void(^)(BOOL success))handler;

@end
