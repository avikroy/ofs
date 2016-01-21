//
//  ModelPhotoGallery.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 04/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelPhotoGallery : NSObject
{
    @private
    NSString *_strID;
    NSString *_strName;
    NSString *_strLink;
    NSString *_strType;
    NSString *_strBusiness;
}

@property(strong,nonatomic,readonly) NSString *strID;
@property(strong,nonatomic,readonly) NSString *strName;
@property(strong,nonatomic,readonly) NSString *strLink;
@property(strong,nonatomic,readonly) NSString *strType;
@property(strong,nonatomic,readonly) NSString *strBusiness;

-(id)initWithDictionary:(NSDictionary*)dict;


@end
