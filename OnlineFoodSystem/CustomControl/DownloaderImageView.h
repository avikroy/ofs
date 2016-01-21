//
//  DownloaderImageView.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 08/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloaderImageView : UIImageView
{
    @private
    UIActivityIndicatorView *activityIndicator;
}

-(void)downloadImageFromURLString:(NSString*)strURL Storage:(NSMutableDictionary*)dict;

@end
