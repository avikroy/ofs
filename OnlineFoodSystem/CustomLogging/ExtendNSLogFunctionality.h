//
//  ExtendNSLogFunctionality.h
//  AlterraCRM
//
//  Created by Tarapada on 27/08/15.
//  Copyright (c) 2015 AppsBee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExtendNSLogFunctionality : NSObject

#ifdef DEBUG
#define NSLog(args...) ExtendNSLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
#define NSLog(x...)
#endif

void ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);

@end
