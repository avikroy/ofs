//
//  ViewOrderViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ViewOrderViewController.h"
#import "OrderDetailItemTableViewCell.h"
#import "OrderDetailDeliveryFeeTableViewCell.h"
#import "OrderDetailTaxTableViewCell.h"
#import "OrderDetailOthersTableViewCell.h"
#import "ModelDishes.h"
#import "CheckoutViewController.h"

typedef NS_ENUM(NSUInteger, CellContent) {
    DeliveryFee,
    Tax,
    ServiceFee,
    Total,
    RowCount,
};

@interface ViewOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    CGFloat productPrice;
    CGFloat deliveryFee;
    CGFloat tax;
    CGFloat serviceFee;
    CGFloat totalPrice;
}

@end

@implementation ViewOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return self.appDel.arrSelectedDishes.count;
    }
    else if (section==1){
        return RowCount;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell=nil;
    if (indexPath.section==0) {
        static NSString *str=@"OrderDetailItemTableViewCell";
        OrderDetailItemTableViewCell *cell=(OrderDetailItemTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell=[[OrderDetailItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        
        //@[@"totalPrice",@"orderCount",@"objDish"]
        NSDictionary *dictTemp=self.appDel.arrSelectedDishes[indexPath.row];
        cell.lblCount.text=[NSString stringWithFormat:@"%ld",(long)[[dictTemp objectForKey:@"orderCount"] integerValue]];
        ModelDishes *objDish=[dictTemp objectForKey:@"objDish"];
        cell.lblItemName.text=objDish.strName;
        cell.lblSpecialInstruction.text=@"";
        cell.lblPrice.text=[NSString stringWithFormat:@"%0.2f",[[dictTemp objectForKey:@"totalPrice"] floatValue]];
        productPrice=[cell.lblPrice.text floatValue]*[cell.lblCount.text integerValue];
        myCell=cell;
    }
    else{
        if (indexPath.row==DeliveryFee) {
            static NSString *str=@"OrderDetailDeliveryFeeTableViewCell";
            OrderDetailDeliveryFeeTableViewCell *cell=(OrderDetailDeliveryFeeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[OrderDetailDeliveryFeeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            cell.lblAmount.text=[NSString stringWithFormat:@"%@",self.appDel.objBusiness.strShipping];
            deliveryFee=[self.appDel.objBusiness.strShipping floatValue];
            myCell=cell;
        }
        else if (indexPath.row==Tax){
            static NSString *str=@"OrderDetailTaxTableViewCell";
            OrderDetailTaxTableViewCell *cell=(OrderDetailTaxTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[OrderDetailTaxTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            cell.lblTaxPercentage.text=[NSString stringWithFormat:@"Tax (%@)",self.appDel.objBusiness.strTax];
            tax=productPrice*[self.appDel.objBusiness.strTax floatValue]/100;
            cell.lblAmount.text=[NSString stringWithFormat:@"%.2f",tax];
            myCell=cell;
        }
        else if (indexPath.row==ServiceFee){
            static NSString *str=@"OrderDetailOthersTableViewCell";
            OrderDetailOthersTableViewCell *cell=(OrderDetailOthersTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[OrderDetailOthersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            cell.lblContent.text=@"Service Fee (4%)";
            cell.lblAmount.text=self.appDel.objBusiness.strServiceFee;
            serviceFee=[cell.lblAmount.text floatValue];
            myCell=cell;
        }
        else if (indexPath.row==Total){
            static NSString *str=@"OrderDetailOthersTableViewCell";
            OrderDetailOthersTableViewCell *cell=(OrderDetailOthersTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[OrderDetailOthersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            cell.lblContent.text=@"Total";
            cell.lblAmount.text=[NSString stringWithFormat:@"%.2f",productPrice+deliveryFee+tax+serviceFee];
            myCell=cell;
        }
    }
    
    myCell.backgroundColor=myCell.contentView.backgroundColor=[UIColor clearColor];
    myCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return myCell;
}

-(IBAction)btnOrderNowPressed:(id)sender
{
    [self performSegueWithIdentifier:@"CheckoutViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CheckoutViewController"]) {
        
    }
}



@end
