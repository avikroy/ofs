//
//  BusinessListTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentSupportView.h"
#import "RatingView.h"
#import "DownloaderImageView.h"

@interface BusinessListTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblName;
@property(strong,nonatomic) IBOutlet UILabel *lblRating;
@property(strong,nonatomic) IBOutlet UILabel *lblDeliveryFee;
@property(strong,nonatomic) IBOutlet UILabel *lblPromotion;
@property(strong,nonatomic) IBOutlet PaymentSupportView *vwPaymentSupport;
@property(strong,nonatomic) IBOutlet RatingView *vwRating;
@property(strong,nonatomic) IBOutlet DownloaderImageView *imgBusiness;

@end
