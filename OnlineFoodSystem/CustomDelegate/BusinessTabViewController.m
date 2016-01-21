//
//  BusinessTabViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 13/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BusinessTabViewController.h"

@interface BusinessTabViewController ()
{
    @private
    IBOutlet UIButton *btnMenu;
    IBOutlet UIButton *btnInfo;
    IBOutlet UIButton *btnReviews;
    IBOutlet UIButton *btnOffers;
}

@end

@implementation BusinessTabViewController

+(BusinessTabViewController*)sharedInstance
{
    static BusinessTabViewController *tabController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabController=[[BusinessTabViewController alloc] initWithNibName:@"BusinessTabViewController" bundle:nil];
    });
    return tabController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setAllNormal];
    [self setBtnToSelected:btnMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSelectedTab:(NSInteger)tabNo
{
    if (tabNo==0) {
        [btnMenu sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else if (tabNo==1){
        [btnInfo sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else if (tabNo==2){
        [btnReviews sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else if (tabNo==3){
        [btnOffers sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)setAllNormal
{
    [btnMenu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnMenu setBackgroundColor:[UIColor whiteColor]];
    
    [btnInfo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnInfo setBackgroundColor:[UIColor whiteColor]];
    
    [btnReviews setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnReviews setBackgroundColor:[UIColor whiteColor]];
    
    [btnOffers setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnOffers setBackgroundColor:[UIColor whiteColor]];
}

-(void)setBtnToSelected:(UIButton*)btn
{
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0f]];
    
}

-(IBAction)btnTabPressed:(UIButton*)btn
{
    [self setAllNormal];
    [self setBtnToSelected:btn];
    
    if (btn==btnMenu) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedMenu:)]) {
            [self.delegate didSelectedMenu:self];
        }
    }
    if (btn==btnInfo) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedInfo:)]) {
            [self.delegate didSelectedInfo:self];
        }
    }
    if (btn==btnReviews) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedReviews:)]) {
            [self.delegate didSelectedReviews:self];
        }
    }
    if (btn==btnOffers) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedOffers:)]) {
            [self.delegate didSelectedOffers:self];
        }
    }
}

@end
