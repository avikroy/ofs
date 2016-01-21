//
//  MenuDetailsViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "MenuDetailsViewController.h"
#import "menuDetailsTableViewCell.h"
#import "ModelDishes.h"
#import "ProductOptionViewController.h"

@interface MenuDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    IBOutlet UILabel *lblCount;
    
    ModelDishes *objSelectedDish;
}

@end

@implementation MenuDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tblDisplay.estimatedRowHeight=50.0f;
    tblDisplay.rowHeight=UITableViewAutomaticDimension;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.appDel.arrSelectedDishes && self.appDel.arrSelectedDishes.count>0) {
        lblCount.hidden=NO;
        NSInteger totalCount=0;
        for (int i=0; i<self.appDel.arrSelectedDishes.count; i++) {
            NSDictionary *dictTemp=self.appDel.arrSelectedDishes[i];
            //@[@"totalPrice",@"orderCount",@"objDish"]
            totalCount+=[[dictTemp objectForKey:@"orderCount"] integerValue];
        }
        lblCount.text=[NSString stringWithFormat:@"%ld",(long)totalCount];
    }else{
        lblCount.hidden=YES;
    }
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
    return self.arrDisplay.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell=@"menuDetailsTableViewCell";
    menuDetailsTableViewCell *cell=(menuDetailsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[menuDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
    }
    
    ModelDishes *obj=self.arrDisplay[indexPath.row];
    
    cell.lblContent.text=obj.strName;
    cell.lblPrice.text=obj.strPrice;
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    objSelectedDish=self.arrDisplay[indexPath.row];
    [self performSegueWithIdentifier:@"ProductOptionViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ProductOptionViewController"]) {
        ProductOptionViewController *master=segue.destinationViewController;
        master.objDish=objSelectedDish;
    }
}

-(IBAction)btnViewOrderPressed:(UIButton*)btn
{
    if (self.appDel.arrSelectedDishes && self.appDel.arrSelectedDishes.count>0) {
        [self performSegueWithIdentifier:@"ViewOrderViewController" sender:self];
    }else{
        [self displayErrorMessage:@"Please select some dish to view the order"];
    }
}

@end
