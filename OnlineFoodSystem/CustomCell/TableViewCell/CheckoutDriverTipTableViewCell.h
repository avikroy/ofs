//
//  CheckoutOrderDetailsTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutDriverTipTableViewCell : UITableViewCell
@property(strong,nonatomic) IBOutlet UIButton *btn1;
@property(strong,nonatomic) IBOutlet UIButton *btn2;
@property(strong,nonatomic) IBOutlet UIButton *btn3;
@property(strong,nonatomic) IBOutlet UIButton *btn4;
@property(strong,nonatomic) IBOutlet UIButton *btn5;

@property(strong,nonatomic) IBOutlet UIImageView *imgRadio1;
@property(strong,nonatomic) IBOutlet UIImageView *imgRadio2;
@property(strong,nonatomic) IBOutlet UIImageView *imgRadio3;
@property(strong,nonatomic) IBOutlet UIImageView *imgRadio4;
@property(strong,nonatomic) IBOutlet UIImageView *imgRadio5;

@property(strong,nonatomic) IBOutlet UILabel *lblDriverTip;

@end
