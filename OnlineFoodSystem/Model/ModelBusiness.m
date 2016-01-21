//
//  ModelBusiness.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ModelBusiness.h"

@implementation ModelBusiness

-(id)initWithDictionary:(NSDictionary *)dict BaseURL:(NSString *)strHeaderURL
{
    if (self=[super init]) {
        if ([dict objectForKey:@"ziprecord"] && ![[dict objectForKey:@"ziprecord"] isKindOfClass:[NSNull class]]) {
            self.zipRecord=[NSNumber numberWithInteger:[[dict objectForKey:@"ziprecord"] integerValue]];
        }else{
            self.strZipCode=@"";
        }
        if ([dict objectForKey:@"reserve"] && ![[dict objectForKey:@"reserve"] isKindOfClass:[NSNull class]]) {
            self.reserve=[NSNumber numberWithInteger:[[dict objectForKey:@"reserve"] integerValue]];
        }else{
            self.reserve=@0;
        }
        if ([dict objectForKey:@"servicefee"] && ![[dict objectForKey:@"servicefee"] isKindOfClass:[NSNull class]]) {
            self.strServiceFee=[dict objectForKey:@"servicefee"];
        }else{
            self.strServiceFee=@"0.00";
        }
        if ([dict objectForKey:@"menulist"] && ![[dict objectForKey:@"menulist"] isKindOfClass:[NSNull class]]) {
            self.menulist=[NSNumber numberWithInteger:[[dict objectForKey:@"menulist"] integerValue]];
        }else{
            self.menulist=@0;
        }
        if ([dict objectForKey:@"parecord"] && ![[dict objectForKey:@"parecord"] isKindOfClass:[NSNull class]]) {
            if ([[[[dict objectForKey:@"parecord"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"FALSE"]) {
                self.isPaRecord=YES;
            }else{
                self.isPaRecord=NO;
            }
        }else{
            self.isPaRecord=NO;
        }
        if ([dict objectForKey:@"currency"] && ![[dict objectForKey:@"currency"] isKindOfClass:[NSNull class]]) {
            self.strCurrency=[dict objectForKey:@"currency"];
        }else{
            self.strCurrency=@"";
        }
        if ([dict objectForKey:@"taxtype"] && ![[dict objectForKey:@"taxtype"] isKindOfClass:[NSNull class]]) {
            self.strTaxType=[dict objectForKey:@"taxtype"];
        }else{
            self.strTaxType=@"";
        }
        if ([dict objectForKey:@"tax"] && ![[dict objectForKey:@"tax"] isKindOfClass:[NSNull class]]) {
            self.strTax=[dict objectForKey:@"tax"];
        }else{
            self.strTax=@"";
        }
        if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
            self.strID=[dict objectForKey:@"id"];
        }else{
            self.strID=@"";
        }
        if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
            self.strName=[dict objectForKey:@"name"];
        }else{
            self.strName=@"";
        }
        if ([dict objectForKey:@"street"] && ![[dict objectForKey:@"street"] isKindOfClass:[NSNull class]]) {
            self.strStreet=[dict objectForKey:@"street"];
        }else{
            self.strStreet=@"";
        }
        if ([dict objectForKey:@"colony"] && ![[dict objectForKey:@"colony"] isKindOfClass:[NSNull class]]) {
            self.strColony=[dict objectForKey:@"colony"];
        }else{
            self.strColony=@"";
        }
        if ([dict objectForKey:@"cp"] && ![[dict objectForKey:@"cp"] isKindOfClass:[NSNull class]]) {
            self.strZipCode=[dict objectForKey:@"cp"];
        }else{
            self.strZipCode=@"";
        }
        if ([dict objectForKey:@"tel"] && ![[dict objectForKey:@"tel"] isKindOfClass:[NSNull class]]) {
            self.strTelephone=[dict objectForKey:@"tel"];
        }else{
            self.strTelephone=@"";
        }
        if ([dict objectForKey:@"cel"] && ![[dict objectForKey:@"cel"] isKindOfClass:[NSNull class]]) {
            self.strMobile=[dict objectForKey:@"cel"];
        }else{
            self.strMobile=@"";
        }
        if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]]) {
            self.strEmail=[dict objectForKey:@"email"];
        }else{
            self.strEmail=@"";
        }
        if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]]) {
            self.strEmail=[dict objectForKey:@"email"];
        }else{
            self.strEmail=@"";
        }
        if ([dict objectForKey:@"categories"] && ![[dict objectForKey:@"categories"] isKindOfClass:[NSNull class]]) {
            self.arrCatgories=[[[dict objectForKey:@"categories"] componentsSeparatedByString:@","] mutableCopy];
        }else{
            self.arrCatgories=[NSMutableArray array];
        }
        if ([dict objectForKey:@"categories"] && ![[dict objectForKey:@"categories"] isKindOfClass:[NSNull class]]) {
            self.arrCatgories=[[NSJSONSerialization JSONObjectWithData:[[dict objectForKey:@"categories"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil] mutableCopy];
        }else{
            self.arrCatgories=[NSMutableArray array];
        }
        if ([dict objectForKey:@"locationPoint"] && ![[dict objectForKey:@"locationPoint"] isKindOfClass:[NSNull class]]) {
            NSDictionary *dictTemp=[NSJSONSerialization JSONObjectWithData:[[dict objectForKey:@"locationPoint"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
            self.coordinate=CLLocationCoordinate2DMake([[dictTemp objectForKey:@"latitud"] doubleValue], [[dictTemp objectForKey:@"longitud"] doubleValue]);
            self.zoom=[[dictTemp objectForKey:@"zoom"] floatValue];
        }else{
            
        }
        if ([dict objectForKey:@"zonesloc"] && ![[dict objectForKey:@"zonesloc"] isKindOfClass:[NSNull class]]) {
            self.strZoneLoc=[dict objectForKey:@"zonesloc"];
        }else{
            self.strZoneLoc=@"";
        }
        if ([dict objectForKey:@"city"] && ![[dict objectForKey:@"city"] isKindOfClass:[NSNull class]]) {
            self.strCity=[dict objectForKey:@"city"];
        }else{
            self.strCity=@"";
        }
        if ([dict objectForKey:@"acceptcard"] && ![[dict objectForKey:@"acceptcard"] isKindOfClass:[NSNull class]]) {
            self.isAcceptCard=([[[[dict objectForKey:@"acceptcard"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"])?NO:YES;
        }else{
            self.isAcceptCard=NO;
        }
        if ([dict objectForKey:@"acceptcash"] && ![[dict objectForKey:@"acceptcash"] isKindOfClass:[NSNull class]]) {
            self.isAcceptCash=([[[[dict objectForKey:@"acceptcash"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"])?NO:YES;
        }else{
            self.isAcceptCash=NO;
        }
        if ([dict objectForKey:@"businesspagecustomtext"] && ![[dict objectForKey:@"businesspagecustomtext"] isKindOfClass:[NSNull class]]) {
            self.strBusinessPageCustomText=[dict objectForKey:@"businesspagecustomtext"];
        }else{
            self.strBusinessPageCustomText=@"";
        }
        if ([dict objectForKey:@"minimum"] && ![[dict objectForKey:@"minimum"] isKindOfClass:[NSNull class]]) {
            self.strMinimum=[dict objectForKey:@"minimum"];
        }else{
            self.strMinimum=@"";
        }
        if ([dict objectForKey:@"firstCatalog"] && ![[dict objectForKey:@"firstCatalog"] isKindOfClass:[NSNull class]]) {
            self.strFirstCatalog=[dict objectForKey:@"firstCatalog"];
        }else{
            self.strFirstCatalog=@"";
        }
        if ([dict objectForKey:@"headerurl"] && ![[dict objectForKey:@"headerurl"] isKindOfClass:[NSNull class]]) {
            self.strHeaderURL=[NSString stringWithFormat:@"%@%@",strHeaderURL,[dict objectForKey:@"headerurl"]];
        }else{
            self.strHeaderURL=@"";
        }
        if ([dict objectForKey:@"twiliophone"] && ![[dict objectForKey:@"twiliophone"] isKindOfClass:[NSNull class]]) {
            self.strTwilioPhone=[dict objectForKey:@"twiliophone"];
        }else{
            self.strTwilioPhone=@"";
        }
        if ([dict objectForKey:@"twilioenabled"] && ![[dict objectForKey:@"twilioenabled"] isKindOfClass:[NSNull class]]) {
            self.isTwilioPhoneEnable=([[dict objectForKey:@"twilioenabled"] boolValue])?YES:NO;
        }else{
            self.isTwilioPhoneEnable=NO;
        }
        if ([dict objectForKey:@"acceptsms"] && ![[dict objectForKey:@"acceptsms"] isKindOfClass:[NSNull class]]) {
            self.isAcceptSMS=([[dict objectForKey:@"acceptsms"] boolValue])?YES:NO;
        }else{
            self.isAcceptSMS=NO;
        }
        if ([dict objectForKey:@"review"] && ![[dict objectForKey:@"review"] isKindOfClass:[NSNull class]]) {
            //NSDictionary *dictTemp=[NSJSONSerialization JSONObjectWithData:[[dict objectForKey:@"review"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
            self.objReview=[[ModelReview alloc] initWithDictionary:[dict objectForKey:@"review"]];
        }else{
            self.objReview=nil;
        }
        if ([dict objectForKey:@"clientkey"] && ![[dict objectForKey:@"clientkey"] isKindOfClass:[NSNull class]]) {
            self.strClientKey=[dict objectForKey:@"clientkey"];
        }else{
            self.strClientKey=@"";
        }
        if ([dict objectForKey:@"secretkey"] && ![[dict objectForKey:@"secretkey"] isKindOfClass:[NSNull class]]) {
            self.strSecretKey=[dict objectForKey:@"secretkey"];
        }else{
            self.strSecretKey=@"";
        }
        if ([dict objectForKey:@"burl"] && ![[dict objectForKey:@"burl"] isKindOfClass:[NSNull class]]) {
            self.strBURL=[dict objectForKey:@"burl"];
        }else{
            self.strBURL=@"";
        }
        if ([dict objectForKey:@"abusiness"] && ![[dict objectForKey:@"abusiness"] isKindOfClass:[NSNull class]]) {
            self.strABusiness=[dict objectForKey:@"abusiness"];
        }else{
            self.strABusiness=@"";
        }
        if ([dict objectForKey:@"distanceformat"] && ![[dict objectForKey:@"distanceformat"] isKindOfClass:[NSNull class]]) {
            self.strDistanceFormat=[dict objectForKey:@"distanceformat"];
        }else{
            self.strDistanceFormat=@"";
        }
        if ([dict objectForKey:@"distance"] && ![[dict objectForKey:@"distance"] isKindOfClass:[NSNull class]]) {
            self.distance=[NSNumber numberWithInteger:[[dict objectForKey:@"distance"] integerValue]];
        }else{
            self.distance=@0;
        }
        if ([dict objectForKey:@"customslug"] && ![[dict objectForKey:@"customslug"] isKindOfClass:[NSNull class]]) {
            self.strCustomSlug=[dict objectForKey:@"customslug"];
        }else{
            self.strCustomSlug=@"";
        }
        if ([dict objectForKey:@"promotion"] && ![[dict objectForKey:@"promotion"] isKindOfClass:[NSNull class]]) {
            self.strPromotion=[dict objectForKey:@"promotion"];
        }else{
            self.strPromotion=@"";
        }
        if ([dict objectForKey:@"isimg"] && ![[dict objectForKey:@"isimg"] isKindOfClass:[NSNull class]]) {
            self.isImage=([[[dict objectForKey:@"isimg"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"1"])?YES:NO;
        }else{
            self.isImage=NO;
        }
        if ([dict objectForKey:@"environment"] && ![[dict objectForKey:@"environment"] isKindOfClass:[NSNull class]]) {
            self.strEnvironment=[dict objectForKey:@"environment"];
        }else{
            self.strEnvironment=@"";
        }
        if ([dict objectForKey:@"merchant_id"] && ![[dict objectForKey:@"merchant_id"] isKindOfClass:[NSNull class]]) {
            self.strMerchentID=[dict objectForKey:@"merchant_id"];
        }else{
            self.strMerchentID=@"";
        }
        if ([dict objectForKey:@"public_key"] && ![[dict objectForKey:@"public_key"] isKindOfClass:[NSNull class]]) {
            self.strPublicKey=[dict objectForKey:@"public_key"];
        }else{
            self.strPublicKey=@"";
        }
        if ([dict objectForKey:@"private_key"] && ![[dict objectForKey:@"private_key"] isKindOfClass:[NSNull class]]) {
            self.strPeivateKey=[dict objectForKey:@"private_key"];
        }else{
            self.strPeivateKey=@"";
        }
        if ([dict objectForKey:@"tkey"] && ![[dict objectForKey:@"tkey"] isKindOfClass:[NSNull class]]) {
            self.strTKey=[dict objectForKey:@"tkey"];
        }else{
            self.strTKey=@"";
        }
        if ([dict objectForKey:@"aplid"] && ![[dict objectForKey:@"aplid"] isKindOfClass:[NSNull class]]) {
            self.strAPLID=[dict objectForKey:@"aplid"];
        }else{
            self.strAPLID=@"";
        }
        if ([dict objectForKey:@"mercury_id"] && ![[dict objectForKey:@"mercury_id"] isKindOfClass:[NSNull class]]) {
            self.strMercuryID=[dict objectForKey:@"mercury_id"];
        }else{
            self.strMercuryID=@"";
        }
        if ([dict objectForKey:@"mercury_pass"] && ![[dict objectForKey:@"mercury_pass"] isKindOfClass:[NSNull class]]) {
            self.strMercuryPass=[dict objectForKey:@"mercury_pass"];
        }else{
            self.strMercuryPass=@"";
        }
        if ([dict objectForKey:@"cardsaveid"] && ![[dict objectForKey:@"cardsaveid"] isKindOfClass:[NSNull class]]) {
            self.strCardSaveID=[dict objectForKey:@"cardsaveid"];
        }else{
            self.strCardSaveID=@"";
        }
        if ([dict objectForKey:@"cardsavepass"] && ![[dict objectForKey:@"cardsavepass"] isKindOfClass:[NSNull class]]) {
            self.strCardSavePass=[dict objectForKey:@"cardsavepass"];
        }else{
            self.strCardSavePass=@"";
        }
        if ([dict objectForKey:@"feature"] && ![[dict objectForKey:@"feature"] isKindOfClass:[NSNull class]]) {
            self.isFeature=([[[[dict objectForKey:@"feature"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"F"])?NO:YES;
        }else{
            self.isFeature=NO;
        }
        if ([dict objectForKey:@"deliverytime"] && ![[dict objectForKey:@"deliverytime"] isKindOfClass:[NSNull class]]) {
            self.strDeliveryTime=[dict objectForKey:@"deliverytime"];
        }else{
            self.strDeliveryTime=@"";
        }
        if ([dict objectForKey:@"pickuptime"] && ![[dict objectForKey:@"pickuptime"] isKindOfClass:[NSNull class]]) {
            self.strPickUpTime=[dict objectForKey:@"pickuptime"];
        }else{
            self.strPickUpTime=@"";
        }
        if ([dict objectForKey:@"catalog"] && ![[dict objectForKey:@"catalog"] isKindOfClass:[NSNull class]]) {
            self.catalog=[NSNumber numberWithInteger:[[dict objectForKey:@"catalog"] integerValue]];
        }else{
            self.catalog=@0;
        }
        if ([dict objectForKey:@"shipping"] && ![[dict objectForKey:@"shipping"] isKindOfClass:[NSNull class]]) {
            self.strShipping=[dict objectForKey:@"shipping"];
        }else{
            self.strShipping=@"";
        }
        if ([dict objectForKey:@"open"] && ![[dict objectForKey:@"open"] isKindOfClass:[NSNull class]]) {
            self.isOpen=[[dict objectForKey:@"open"] boolValue];
        }else{
            self.isOpen=NO;
        }
        if ([dict objectForKey:@"DeliveryStatus"] && ![[dict objectForKey:@"DeliveryStatus"] isKindOfClass:[NSNull class]]) {
            self.isDeliveryStatus=[[[[dict objectForKey:@"DeliveryStatus"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"TRUE"]?YES:NO;
        }else{
            self.isDeliveryStatus=NO;
        }
        if ([dict objectForKey:@"PickupStatus"] && ![[dict objectForKey:@"PickupStatus"] isKindOfClass:[NSNull class]]) {
            self.isPickupStatus=[[[[dict objectForKey:@"PickupStatus"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"TRUE"]?YES:NO;
        }else{
            self.isPickupStatus=NO;
        }
        if ([dict objectForKey:@"paymentdetails"] && ![[dict objectForKey:@"paymentdetails"] isKindOfClass:[NSNull class]]) {
            NSDictionary *dictTemp=[NSJSONSerialization JSONObjectWithData:[[dict objectForKey:@"paymentdetails"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
            self.objPaymentDetails=[[ModelPaymentDetails alloc] initWithDictionary:dictTemp];
        }else{
            self.objPaymentDetails=nil;
        }
        if ([dict objectForKey:@"reviewsettings"] && ![[dict objectForKey:@"reviewsettings"] isKindOfClass:[NSNull class]]) {
            self.strReviewSettings=[dict objectForKey:@"reviewsettings"];
        }else{
            self.strReviewSettings=nil;
        }
        if ([dict objectForKey:@"photosettings"] && ![[dict objectForKey:@"photosettings"] isKindOfClass:[NSNull class]]) {
            self.strPhotoSettings=[dict objectForKey:@"photosettings"];
        }else{
            self.strPhotoSettings=nil;
        }
        if ([dict objectForKey:@"deliverycitysearch"] && ![[dict objectForKey:@"deliverycitysearch"] isKindOfClass:[NSNull class]]) {
            self.isDeliveryCitySearch=[[dict objectForKey:@"deliverycitysearch"] boolValue];
        }else{
            self.isDeliveryCitySearch=NO;
        }
        if ([dict objectForKey:@"againmenuopenchk"] && ![[dict objectForKey:@"againmenuopenchk"] isKindOfClass:[NSNull class]]) {
            self.isAgainMenuOpenCheck=[[dict objectForKey:@"againmenuopenchk"] boolValue];
        }else{
            self.isAgainMenuOpenCheck=NO;
        }
        if ([dict objectForKey:@"opentime"] && ![[dict objectForKey:@"opentime"] isKindOfClass:[NSNull class]]) {
            self.strOpenTime=[dict objectForKey:@"opentime"];
        }else{
            self.strOpenTime=@"";
        }
        if ([dict objectForKey:@"closetime"] && ![[dict objectForKey:@"closetime"] isKindOfClass:[NSNull class]]) {
            self.strCloseTime=[dict objectForKey:@"closetime"];
        }else{
            self.strCloseTime=@"";
        }
        if ([dict objectForKey:@"deliveryzone"] && ![[dict objectForKey:@"deliveryzone"] isKindOfClass:[NSNull class]]) {
            self.isDeliveryZone=[[dict objectForKey:@"deliveryzone"] boolValue];
        }else{
            self.isDeliveryZone=NO;
        }
        if ([dict objectForKey:@"searchlocationType"] && ![[dict objectForKey:@"searchlocationType"] isKindOfClass:[NSNull class]]) {
            self.strSearchLocationType=[dict objectForKey:@"searchlocationType"];
        }else{
            self.strSearchLocationType=@"";
        }
        if ([dict objectForKey:@"searchtype"] && ![[dict objectForKey:@"searchtype"] isKindOfClass:[NSNull class]]) {
            self.strSearchType=[dict objectForKey:@"searchtype"];
        }else{
            self.strSearchType=@"";
        }
    }
    return self;
}

@end
