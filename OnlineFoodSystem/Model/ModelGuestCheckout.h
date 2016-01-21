//
//  ModelGuestCheckout.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 05/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelGuestCheckout : NSObject
{
    @private
    NSString *_strID;
    NSString *_strFieldName;
    BOOL _required;
}

@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strFieldName;
@property(strong,nonatomic) NSString *strFieldValue;
@property(assign,nonatomic,readonly,getter=isRequired) BOOL required;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
