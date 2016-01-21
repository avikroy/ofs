//
//  MyOrderTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblNumber;
@property(strong,nonatomic) IBOutlet UILabel *lblDate;
@property(strong,nonatomic) IBOutlet UILabel *lblBusiness;
@property(strong,nonatomic) IBOutlet UIButton *btnViewMore;

@end
