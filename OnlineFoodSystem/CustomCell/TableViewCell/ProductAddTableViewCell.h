//
//  ProductAddTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 20/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductAddTableViewCell : UITableViewCell

@property(strong,nonatomic,nullable) IBOutlet UIButton *btnMinus;
@property(strong,nonatomic,nullable) IBOutlet UIButton *btnPlus;
@property(strong,nonatomic,nullable) IBOutlet UIButton *btnAdd;
@property(strong,nonatomic,nullable) IBOutlet UILabel *lblCount;
@property(strong,nonatomic,nullable) IBOutlet UILabel *lblTotalPrice;

@end
