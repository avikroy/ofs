//
//  AppDelegate.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Model/ModelUser.h"

#import "ModelTabSettings.h"
#import "ModelDeliverySettings.h"
#import "ModelPickUpSettings.h"
#import "ModelReservationSettings.h"

#import "ModelCountry.h"
#import "ModelCity.h"
#import "ModelColony.h"
#import "ModelBusiness.h"

@import MapKit;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic) ModelUser *objUser;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(assign,nonatomic) BOOL isRechable;

@property(strong,nonatomic) UINavigationController *navController;

@property(strong,nonatomic) ModelTabSettings *objTabSettings;
@property(strong,nonatomic) ModelDeliverySettings *objDeliverySettings;
@property(strong,nonatomic) ModelPickUpSettings *objPickUpSettings;
@property(strong,nonatomic) ModelReservationSettings *objReservationSettings;

@property(strong,nonatomic) NSMutableArray *arrBusinessType;
@property(strong,nonatomic) NSMutableArray *arrDelivery;
@property(strong,nonatomic) NSMutableArray *arrPickUp;
@property(strong,nonatomic) NSMutableArray *arrReservation;

@property(strong,nonatomic) ModelCountry *objSelectedCountry;
@property(strong,nonatomic) ModelCity *objSelectedCity;
@property(strong,nonatomic) ModelColony *objSelectedColony;
@property(strong,nonatomic) ModelBusiness *objBusiness;

@property(strong,nonatomic) NSString *strSelectedAddress;
@property(strong,nonatomic) NSString *strSelectedZipCode;
@property(assign,nonatomic) CLLocationCoordinate2D coordinateSelected;

@property(strong,nonatomic) NSMutableArray *arrCategory;
@property(strong,nonatomic) NSMutableArray *arrCategoryCustom;
@property(strong,nonatomic) NSMutableDictionary *dictCategoryCustome;

@property(strong,nonatomic) NSMutableArray *arrAllCategory;
@property(strong,nonatomic) NSMutableArray *arrFavouriteCategory;

@property(strong,nonatomic) NSMutableArray *arrSelectedDishes;

@property(assign,nonatomic) BOOL isUserSignedIn;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

