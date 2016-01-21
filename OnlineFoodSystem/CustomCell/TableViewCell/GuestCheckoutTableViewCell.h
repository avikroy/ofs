//
//  GuestCheckoutTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuestCheckoutTableViewCell : UITableViewCell

@property(strong,nonatomic,nullable) IBOutlet UILabel *lblContent;
@property(strong,nonatomic,nullable) IBOutlet UITextField *txtContent;

@end
