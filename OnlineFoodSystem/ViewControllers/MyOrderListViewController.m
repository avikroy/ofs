//
//  MyOrderListViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "MyOrderListViewController.h"
#import "MyOrderListTableViewCell.h"

@interface MyOrderListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
}

@end

@implementation MyOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tblDisplay.estimatedRowHeight=50.0f;
    tblDisplay.rowHeight=UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *strCell=@"MyOrderListTableViewCell";
    MyOrderListTableViewCell *cell=(MyOrderListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[MyOrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
    }
    
    cell.imgBG.backgroundColor=[UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1.0f];
    cell.lblNo.text=@"";
    cell.lblDate.text=@"Date";
    cell.lblBusiness.text=@"Business";
    cell.btnViewMore.hidden=YES;
    
    cell.lblNo.textColor=cell.lblDate.textColor=cell.lblBusiness.textColor=[UIColor blackColor];
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell=@"MyOrderListTableViewCell";
    MyOrderListTableViewCell *cell=(MyOrderListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[MyOrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
    }
    cell.imgBG.backgroundColor=[UIColor whiteColor];
    cell.lblNo.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.lblDate.text=@"2015-09-28 9:23 PM";
    cell.lblBusiness.text=@"McDonalds";
    [cell.btnViewMore addTarget:self action:@selector(btnViewMorePressed:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnViewMore.tag=indexPath.row;
    cell.btnViewMore.layer.borderWidth=1.5f;
    cell.btnViewMore.layer.borderColor=[UIColor colorWithRed:241.0f/255.0f green:89.0f/255.0f blue:89.0f/255.0f alpha:1.0f].CGColor;
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    return cell;
}

-(IBAction)btnViewMorePressed:(UIButton*)btn
{
    
}


@end
