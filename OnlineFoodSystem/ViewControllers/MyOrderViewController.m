//
//  MyOrderViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 12/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderTableViewCell.h"
#import "MyOrderWebService.h"
#import "ModelMyOrder.h"

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrDisplay;
}

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[MyOrderWebService service] callMyOrderForUserID:self.appDel.objUser.strId CompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            [self displayErrorMessage:strMsg];
        }else{
            
        }
    }];
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
    return 40.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *str=@"MyOrderTableViewCell";
    MyOrderTableViewCell *cell=(MyOrderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[MyOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.lblNumber.text=@"#";
    cell.lblDate.text=@"Date";
    cell.lblBusiness.text=@"Business";
    cell.btnViewMore.hidden=YES;
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor colorWithRed:249.0f/255.0f green:249.0f/255.0f blue:249.0f/255.0f alpha:1.0f];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"MyOrderTableViewCell";
    MyOrderTableViewCell *cell=(MyOrderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[MyOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.lblNumber.text=@"1";
    cell.lblDate.text=@"Date";
    cell.lblBusiness.text=@"Business";

    cell.btnViewMore.tag=indexPath.row;
    [cell.btnViewMore addTarget:self action:@selector(btnViewMorePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor whiteColor];//[UIColor colorWithRed:249.0f/255.0f green:249.0f/255.0f blue:249.0f/255.0f alpha:1.0f];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)btnViewMorePressed:(UIButton*)btn
{
    
}

@end
