//
//  ProductOptionWebService.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 15/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import "ModelProductOptionOuter.h"

@interface ProductOptionWebService : WebServiceBaseClass

+(ProductOptionWebService*)service;

-(void)callProductOptionWebServiceWithExtrasID:(NSArray*)arrExtrasID DishID:(NSString*)strDishID CompletionHandler:(WebServiceCompletionHandler)handler;

@end
