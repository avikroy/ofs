//
//  OrderDetailItemTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailItemTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblCount;
@property(strong,nonatomic) IBOutlet UILabel *lblItemName;
@property(strong,nonatomic) IBOutlet UILabel *lblSpecialInstruction;
@property(strong,nonatomic) IBOutlet UILabel *lblPrice;

@end
