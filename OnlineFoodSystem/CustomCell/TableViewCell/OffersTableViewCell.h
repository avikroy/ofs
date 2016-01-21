//
//  OffersTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffersTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblOfferName;
@property(strong,nonatomic) IBOutlet UILabel *lblOfferPrice;
@property(strong,nonatomic) IBOutlet UILabel *lblStartDate;
@property(strong,nonatomic) IBOutlet UILabel *lblEndDate;
@property(strong,nonatomic) IBOutlet UIImageView *imgBG;

@end
