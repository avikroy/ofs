//
//  CheckoutMapTableViewCell.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface CheckoutMapTableViewCell : UITableViewCell

@property(strong,nonatomic) IBOutlet MKMapView *myMap;
@property(strong,nonatomic) IBOutlet UILabel *lblAddress;

@end
