//
//  ModelBusiness.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ModelReview.h"
#import "ModelPaymentDetails.h"

@interface ModelBusiness : NSObject

@property(assign,nonatomic) NSNumber *zipRecord;
@property(assign,nonatomic) NSNumber *reserve;
@property(assign,nonatomic) NSNumber *menulist;
@property(assign,nonatomic) BOOL isPaRecord;
@property(strong,nonatomic) NSString *strCurrency;
@property(strong,nonatomic) NSString *strTaxType;
@property(strong,nonatomic) NSString *strTax;
@property(strong,nonatomic) NSString *strID;
@property(strong,nonatomic) NSString *strName;
@property(strong,nonatomic) NSString *strStreet;
@property(strong,nonatomic) NSString *strColony;
@property(strong,nonatomic) NSString *strZipCode;
@property(strong,nonatomic) NSString *strTelephone;
@property(strong,nonatomic) NSString *strMobile;
@property(strong,nonatomic) NSString *strEmail;
@property(strong,nonatomic) NSMutableArray *arrCatgories;
@property(assign,nonatomic) CLLocationCoordinate2D coordinate;
@property(assign,nonatomic) CGFloat zoom;
@property(strong,nonatomic) NSString *strZoneLoc;
@property(strong,nonatomic) NSString *strCity;
@property(assign,nonatomic) BOOL isAcceptCard;
@property(assign,nonatomic) BOOL isAcceptCash;
@property(strong,nonatomic) NSString *strBusinessPageCustomText;
@property(strong,nonatomic) NSString *strMinimum;
@property(strong,nonatomic) NSString *strFirstCatalog;
@property(strong,nonatomic) NSString *strHeaderURL;
@property(strong,nonatomic) NSString *strTwilioPhone;
@property(assign,nonatomic) BOOL isTwilioPhoneEnable;
@property(assign,nonatomic) BOOL isAcceptSMS;
@property(strong,nonatomic) NSString *strClientKey;
@property(strong,nonatomic) NSString *strSecretKey;
@property(strong,nonatomic) NSString *strBURL;
@property(strong,nonatomic) NSString *strABusiness;
@property(strong,nonatomic) NSString *strDistanceFormat;
@property(assign,nonatomic) NSNumber *distance;
@property(strong,nonatomic) NSString *strCustomSlug;
@property(strong,nonatomic) NSString *strPromotion;
@property(assign,nonatomic) BOOL isImage;
@property(strong,nonatomic) NSString *strEnvironment;
@property(strong,nonatomic) NSString *strMerchentID;
@property(strong,nonatomic) NSString *strPublicKey;
@property(strong,nonatomic) NSString *strPeivateKey;
@property(strong,nonatomic) NSString *strTKey;
@property(strong,nonatomic) NSString *strAPLID;
@property(strong,nonatomic) NSString *strMercuryID;
@property(strong,nonatomic) NSString *strMercuryPass;
@property(strong,nonatomic) NSString *strCardSaveID;
@property(strong,nonatomic) NSString *strCardSavePass;
@property(assign,nonatomic) BOOL isFeature;
@property(strong,nonatomic) NSString *strDeliveryTime;
@property(strong,nonatomic) NSString *strPickUpTime;

@property(strong,nonatomic) NSNumber *catalog;
@property(strong,nonatomic) NSString *strShipping;
@property(assign,nonatomic) BOOL isOpen;
@property(assign,nonatomic) BOOL isDeliveryStatus;
@property(assign,nonatomic) BOOL isPickupStatus;

@property(strong,nonatomic) NSString *strReviewSettings;
@property(strong,nonatomic) NSString *strPhotoSettings;
@property(assign,nonatomic) BOOL isDeliveryCitySearch;
@property(assign,nonatomic) BOOL isAgainMenuOpenCheck;
@property(assign,nonatomic) BOOL isDeliveryZone;
@property(strong,nonatomic) NSString *strOpenTime;
@property(strong,nonatomic) NSString *strCloseTime;
@property(strong,nonatomic) NSString *strSearchLocationType;
@property(strong,nonatomic) NSString *strSearchType;
@property(strong,nonatomic) NSString *strServiceFee;
@property(strong,nonatomic) ModelReview *objReview;
@property(strong,nonatomic) ModelPaymentDetails *objPaymentDetails;

-(id)initWithDictionary:(NSDictionary*)dict BaseURL:(NSString*)strHeaderURL;


@end
