//
//  ProductRadioTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 20/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductRadioTableViewCell : UITableViewCell

@property(strong,nonatomic,nullable) IBOutlet UIImageView *imgRadio;
@property(strong,nonatomic,nullable) IBOutlet UILabel *lblContent;
@property(strong,nonatomic,nullable) IBOutlet UILabel *lblPrice;

@end
