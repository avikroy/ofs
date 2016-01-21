//
//  CategoryListViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CategoryListViewController.h"
#import "ModelBusiness.h"
#import "BusinessListTableViewCell.h"
#import "ModelBusiness.h"
#import "ModelReview.h"

@interface CategoryListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrDisplay;
    
    NSMutableDictionary *dictImage;
}

@end

@implementation CategoryListViewController

+(CategoryListViewController*)sharedInstance
{
    static CategoryListViewController *controller=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller=[[CategoryListViewController alloc] initWithNibName:@"CategoryListViewController" bundle:nil];
        
    });
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(businessValueReceived:) name:@"BusinessValueReceived" object:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    dictImage=[NSMutableDictionary dictionary];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    dictImage=nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"BusinessValueReceived" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)businessValueReceived:(NSNotification*)notification
{
    arrDisplay=[self.delegate getListDataSource:self];
    [tblDisplay reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrDisplay.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 208.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellIdentifier=@"MyCell";
    BusinessListTableViewCell *cell=(BusinessListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCellIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BusinessListTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    ModelBusiness *objBusiness=arrDisplay[indexPath.row];
    cell.lblName.text=[[objBusiness.strName capitalizedString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    cell.lblRating.text=[NSString stringWithFormat:@"(%@ Ratings)",objBusiness.objReview.strTotal];
    cell.lblDeliveryFee.text=[NSString stringWithFormat:@"Delivery fee: %@ %@",objBusiness.strCurrency,objBusiness.strShipping];
    if (objBusiness.strPromotion.length>0) {
        cell.lblPromotion.text=[NSString stringWithFormat:@"Promotion: %@",objBusiness.strPromotion];
    }else{
        cell.lblPromotion.hidden=YES;
    }
    
    cell.vwPaymentSupport.payment=objBusiness.objPaymentDetails;
    [cell.vwPaymentSupport refresh];
    
    [cell.vwRating setRating:/*[objBusiness.objReview.strTotal integerValue]*/1];
    [cell.imgBusiness layoutIfNeeded];
    [cell.imgBusiness downloadImageFromURLString:objBusiness.strHeaderURL Storage:dictImage];
    
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedCategoryIndex:Controller:)]) {
        [self.delegate didSelectedCategoryIndex:indexPath.row Controller:self];
    }
}

@end
