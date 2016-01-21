//
//  MyOrderListTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderListTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblNo;
@property(strong,nonatomic) IBOutlet UILabel *lblDate;
@property(strong,nonatomic) IBOutlet UILabel *lblBusiness;
@property(strong,nonatomic) IBOutlet UIButton *btnViewMore;
@property(strong,nonatomic) IBOutlet UIImageView *imgBG;

@end
