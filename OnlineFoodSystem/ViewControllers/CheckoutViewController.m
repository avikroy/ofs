//
//  CheckoutViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 22/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CheckoutViewController.h"
#import "CheckoutDriverTipTableViewCell.h"
#import "CheckoutOrderSummeryTableViewCell.h"
#import "CheckoutMapTableViewCell.h"
#import "MyCustomAnnonation.h"
#import "MyCustomPinAnnotationView.h"
#import "CheckoutDriverTipTableViewCell.h"
#import "CheckoutOrderDetailTableViewCell.h"
#import "CheckoutDriverTipTableViewCell.h"
#import "OrderDetailItemTableViewCell.h"
#import "OrderDetailOthersTableViewCell.h"
#import "ModelDishes.h"
#import "FacebookLoginViewController.h"

@interface CheckoutViewController ()<UITableViewDelegate,UITableViewDataSource,MKMapViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSInteger selectedDriverTips;
    
    CGFloat productPrice;
    CGFloat deliveryFee;
    CGFloat tax;
    CGFloat serviceFee;
    CGFloat totalPrice;
    CGFloat driverTip;
}

@end

@implementation CheckoutViewController

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
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *vw=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, [self tableView:tableView heightForHeaderInSection:section])];
    vw.backgroundColor=[UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
    UILabel *lblContent=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, vw.frame.size.width-20, vw.frame.size.height)];
    lblContent.font=[UIFont systemFontOfSize:12.0f];
    [vw addSubview:lblContent];
    
    if (section==0) {
        lblContent.text=@"Delivery Address";
    }
    else if (section==1){
        lblContent.text=@"Order Details";
    }
    else if (section==2){
        lblContent.text=@"Order Summery";
    }
    
    
    return vw;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 3;
    }
    if (section==2) {
        return 6;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height=0.0f;
    if (indexPath.section==0) {
        height=150.0f;
    }
    else if (indexPath.section==1){
        if (indexPath.row==0 || indexPath.row==1) {
            height=35.0f;
        }else{
            height=106.0f;
        }
    }
    else if (indexPath.section==2){
        if (indexPath.row==0) {
            height=65.0f;
        }else{
            height=35.0f;
        }
    }
    
    return height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell=nil;
    
    if (indexPath.section==0) {
        static NSString *str=@"CheckoutMapTableViewCell";
        CheckoutMapTableViewCell *cell=(CheckoutMapTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell=[[CheckoutMapTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        [cell.myMap removeAnnotations:cell.myMap.annotations];
        MyCustomAnnonation *annotation=[[MyCustomAnnonation alloc] initWithTitle:@"Selected Location" Location:self.appDel.coordinateSelected];
        [cell.myMap addAnnotation:annotation];
        [cell.myMap setCenterCoordinate:self.appDel.coordinateSelected animated:YES];
        cell.myMap.delegate=self;
        cell.lblAddress.text=self.appDel.strSelectedAddress;
        myCell=cell;
    }
    else if (indexPath.section==1){
        if (indexPath.row==2) {
            static NSString *str=@"CheckoutDriverTipTableViewCell";
            CheckoutDriverTipTableViewCell *cell=(CheckoutDriverTipTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[CheckoutDriverTipTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            cell.lblDriverTip.text=[NSString stringWithFormat:@"$ %.2f",driverTip];
            
            [cell.btn1 addTarget:self action:@selector(btnRadioPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn2 addTarget:self action:@selector(btnRadioPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn3 addTarget:self action:@selector(btnRadioPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn4 addTarget:self action:@selector(btnRadioPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn5 addTarget:self action:@selector(btnRadioPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            switch (selectedDriverTips) {
                case 1:
                    cell.imgRadio1.image=[UIImage imageNamed:@"radio_btn_checked.png"];
                    cell.imgRadio2.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio3.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio4.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio5.image=[UIImage imageNamed:@"radio_btn.png"];
                    break;
                case 2:
                    cell.imgRadio1.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio2.image=[UIImage imageNamed:@"radio_btn_checked.png"];
                    cell.imgRadio3.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio4.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio5.image=[UIImage imageNamed:@"radio_btn.png"];
                    break;
                case 3:
                    cell.imgRadio1.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio2.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio3.image=[UIImage imageNamed:@"radio_btn_checked.png"];
                    cell.imgRadio4.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio5.image=[UIImage imageNamed:@"radio_btn.png"];
                    break;
                case 4:
                    cell.imgRadio1.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio2.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio3.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio4.image=[UIImage imageNamed:@"radio_btn_checked.png"];
                    cell.imgRadio5.image=[UIImage imageNamed:@"radio_btn.png"];
                    break;
                case 5:
                    cell.imgRadio1.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio2.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio3.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio4.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio5.image=[UIImage imageNamed:@"radio_btn_checked.png"];
                    break;
                    
                default:
                    cell.imgRadio1.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio2.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio3.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio4.image=[UIImage imageNamed:@"radio_btn.png"];
                    cell.imgRadio5.image=[UIImage imageNamed:@"radio_btn.png"];
                    break;
            }

            
            myCell=cell;
        }else{
            static NSString *str=@"CheckoutOrderDetailTableViewCell";
            CheckoutOrderDetailTableViewCell *cell=(CheckoutOrderDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[CheckoutOrderDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            if (indexPath.row==0) {
                cell.lblLeft.text=@"Delivery Time";
                cell.lblRight.text=@"ASAP (about 44 mins)";
            }
            else{
                cell.lblLeft.text=@"Payment";
                cell.lblRight.text=@"None Chosen";
            }
            
            myCell=cell;
        }
    }
    else if (indexPath.section==2){
        if (indexPath.row==0) {
            static NSString *str=@"OrderDetailItemTableViewCell";
            OrderDetailItemTableViewCell *cell=(OrderDetailItemTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[OrderDetailItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            NSDictionary *dictTemp=self.appDel.arrSelectedDishes[indexPath.row];
            ModelDishes *objDish=[dictTemp objectForKey:@"objDish"];
            cell.lblItemName.text=objDish.strName;
            cell.lblSpecialInstruction.text=@"";
            cell.lblPrice.text=[NSString stringWithFormat:@"%0.2f",[[dictTemp objectForKey:@"totalPrice"] floatValue]];
            productPrice=[cell.lblPrice.text floatValue]*[cell.lblCount.text integerValue];
            myCell=cell;
        }else{
            static NSString *str=@"OrderDetailOthersTableViewCell";
            OrderDetailOthersTableViewCell *cell=(OrderDetailOthersTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[OrderDetailOthersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            if (indexPath.row==1) {
                cell.lblContent.text=@"Subtotal";
                cell.lblAmount.text=[NSString stringWithFormat:@"$ %.2f",totalPrice];
            }
            if (indexPath.row==2) {
                cell.lblContent.text=[NSString stringWithFormat:@"Tax (%@)",self.appDel.objBusiness.strTax];
                tax=productPrice*[self.appDel.objBusiness.strTax floatValue]/100;
                cell.lblAmount.text=[NSString stringWithFormat:@"$ %.2f",tax];
            }
            if (indexPath.row==3) {
                cell.lblContent.text=@"Delivery Fee";
                cell.lblAmount.text=[NSString stringWithFormat:@"$ %@",self.appDel.objBusiness.strShipping];
                deliveryFee=[self.appDel.objBusiness.strShipping floatValue];
            }
            if (indexPath.row==4) {
                cell.lblContent.text=@"Driver Tip";
                cell.lblAmount.text=[NSString stringWithFormat:@"$ %.2f",driverTip];
            }
            if (indexPath.row==5) {
                cell.lblContent.text=@"Total";
                cell.lblAmount.text=[NSString stringWithFormat:@"$ %.2f",productPrice+deliveryFee+tax+serviceFee+driverTip];
            }
            myCell=cell;
        }
    }
    
    myCell.backgroundColor=myCell.contentView.backgroundColor=[UIColor clearColor];
    myCell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return myCell;
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MyCustomAnnonation class]]) {
        MyCustomAnnonation *location=(MyCustomAnnonation*)annotation;
        MyCustomPinAnnotationView *annotationView=[[MyCustomPinAnnotationView alloc] initWithAnnotation:annotation Coordinate:location.coordinate PinType:PIN_USER_LOCATION];
        return annotationView;
    }else{
        return nil;
    }
    return nil;
}

-(void)btnRadioPressed:(UIButton*)sender
{
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:2 inSection:1];
    CheckoutDriverTipTableViewCell *cell=(CheckoutDriverTipTableViewCell*)[tblDisplay cellForRowAtIndexPath:indexPath];
    
    NSDictionary *dictTemp=self.appDel.arrSelectedDishes[0];
    CGFloat myPrice=[[dictTemp objectForKey:@"totalPrice"] floatValue];
    
    if (sender==cell.btn1) {
        [cell.btn1 setSelected:YES];
        selectedDriverTips=1;
        driverTip=myPrice*10/100;
    }
    else if (sender==cell.btn2) {
        [cell.btn2 setSelected:YES];
        selectedDriverTips=2;
        driverTip=myPrice*15/100;
    }
    else if (sender==cell.btn3) {
        [cell.btn3 setSelected:YES];
        selectedDriverTips=3;
        driverTip=myPrice*20/100;
    }
    else if (sender==cell.btn4) {
        [cell.btn4 setSelected:YES];
        selectedDriverTips=4;
        driverTip=myPrice*25/100;
    }
    else if (sender==cell.btn5) {
        [cell.btn5 setSelected:YES];
        selectedDriverTips=5;
    }
    
    [tblDisplay reloadData];
}

-(IBAction)btnPlaceOrderPressed:(id)sender
{
    [self performSegueWithIdentifier:@"FacebookLoginViewController" sender:self];
}

@end
