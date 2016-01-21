//
//  DeliveryTypeSelectorViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "DeliveryTypeSelectorViewController.h"

@interface DeliveryTypeSelectorViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UILabel *lblTitle;
    IBOutlet UITableView *tblDisplay;
    
}

@end

@implementation DeliveryTypeSelectorViewController

+(DeliveryTypeSelectorViewController*)sharedInstance
{
    static DeliveryTypeSelectorViewController *deliveryTypeSelector=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deliveryTypeSelector=[[DeliveryTypeSelectorViewController alloc] initWithNibName:@"DeliveryTypeSelectorViewController" bundle:nil];
    });
    return deliveryTypeSelector;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate dataSourceArray:self].count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"MyCell";
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.textLabel.text=[[self.delegate dataSourceArray:self] objectAtIndex:indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [self.delegate didSelectedIndex:indexPath.row];
    }
}



@end
