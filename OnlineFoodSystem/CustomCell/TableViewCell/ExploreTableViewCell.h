//
//  ExploreTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExploreTextField.h"

@interface ExploreTableViewCell : UITableViewCell

@property(strong,nonatomic,nonnull) IBOutlet ExploreTextField *txtContent;
@property(strong,nonnull,nonatomic) IBOutlet UIButton *btnRight;
@property(strong,nonatomic,nonnull) IBOutlet UIImageView *imgArrow;

@end
