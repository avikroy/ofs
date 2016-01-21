//
//  ReviewsTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 19/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"

@interface ReviewsTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *lblLeft;
@property(strong,nonatomic) IBOutlet UILabel *lblRight;
@property(strong,nonatomic) IBOutlet RatingView *vwRating;

@end
