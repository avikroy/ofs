//
//  SignUpTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 20/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblHeader;
@property(strong,nonatomic) IBOutlet UITextField *txtContent;
@property(strong,nonatomic) IBOutlet UIImageView *imgDropDown;
@property(strong,nonatomic) IBOutlet UIButton *btnDropDown;

@end
