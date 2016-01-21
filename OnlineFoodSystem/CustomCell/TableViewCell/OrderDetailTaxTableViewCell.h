//
//  OrderDetailTaxTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailTaxTableViewCell : UITableViewCell
@property(strong,nonatomic) IBOutlet UILabel *lblTaxPercentage;
@property(strong,nonatomic) IBOutlet UILabel *lblAmount;

@end
