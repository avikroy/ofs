//
//  MyOrderMoreViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "MyOrderMoreViewController.h"
#import "MyOrderMoreTableViewCell.h"

@interface MyOrderMoreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
}

@end

@implementation MyOrderMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tblDisplay.estimatedRowHeight=40.0f;
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
    return 40;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *strCell=@"MyOrderMoreTableViewCell";
    MyOrderMoreTableViewCell *cell=(MyOrderMoreTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[MyOrderMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
    }
    
    cell.imgBG.backgroundColor=[UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1.0f];
    cell.lblCityName.text=@"City";
    cell.lblStatus.text=@"Status";
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell=@"MyOrderMoreTableViewCell";
    MyOrderMoreTableViewCell *cell=(MyOrderMoreTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[MyOrderMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
    }
    cell.imgBG.backgroundColor=[UIColor whiteColor];
    cell.lblCityName.text=@"New York";
    cell.lblStatus.text=@"Pending";
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    return cell;
}


@end
