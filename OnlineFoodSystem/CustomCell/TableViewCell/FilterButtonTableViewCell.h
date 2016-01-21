//
//  FilterButtonTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterButtonTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblContent;
@property(strong,nonatomic) IBOutlet UILabel *lblText;
@property(strong,nonatomic) IBOutlet UIImageView *imgArrow;
@property(strong,nonatomic) IBOutlet UIButton *btn;
@property(strong,nonatomic) IBOutlet NSLayoutConstraint *consHeight;

@end
