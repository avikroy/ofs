//
//  ModelCatalogMenu.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCatalogMenu : NSObject
{
    @private
    NSString *_strName;
    NSString *_strOpenCloseTime;
    NSString *_strDays;
}


@property(strong,nonatomic,readonly) NSString *strName;
@property(strong,nonatomic,readonly) NSString *strOpenCloseTime;
@property(strong,nonatomic,readonly) NSString *strDays;

-(id)initWithDictionary:(NSDictionary*)dict Days:(NSInteger)day;

@end
