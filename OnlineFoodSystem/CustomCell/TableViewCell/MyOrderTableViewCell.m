//
//  MyOrderTableViewCell.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "MyOrderTableViewCell.h"

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.btnViewMore.layer.borderWidth=1.0f;
    self.btnViewMore.layer.borderColor=[UIColor colorWithRed:234.0f/255.0f green:161.0f/255.0f blue:159.0f/255.0f alpha:1.0f].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
