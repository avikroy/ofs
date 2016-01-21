//
//  ExplorerViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#import "ExplorerViewController.h"
#import "ExploreTableViewCell.h"
#import "DeliveryTypeSelectorViewController.h"
#import "ChooseAddressViewController.h"
#import "TabSettingsWebService.h"

#import "ModelCountry.h"
#import "ModelCity.h"
#import "ModelColony.h"

#import "CountrySelectionViewController.h"
#import "CitySelectionViewController.h"
#import "ColonySelectionViewController.h"
#import "BusinessTypeSelectorViewController.h"


static NSString *strCellIdentifir=@"ExploreTableViewCell";

@interface ExplorerViewController ()<UITableViewDataSource,UITableViewDelegate,DeliveryTypeSelectorViewControllerDelegate,UITextFieldDelegate,CountrySelectionViewControllerDelegate,CitySelectionViewControllerDelegate,ColonySelectionViewControllerDelegate>
{
    @private
    IBOutlet UIButton *btnType;
    IBOutlet UITableView *tblDisplay;
    IBOutlet UILabel *lblOrderType;
    
    NSMutableArray *arrBusinessType;
    
    NSInteger bussinessType;
    
    ModelCountry *mySelectedCountry;
    ModelCity *mySelectedCity;
    ModelColony *mySelectedColony;
}

@end

@implementation ExplorerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    btnType.layer.borderColor=[UIColor whiteColor].CGColor;
    btnType.layer.borderWidth=1.0f;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    btnType.layer.cornerRadius=5.0f;//btnType.frame.size.height/4.0f;
    
    
//    if (self.appDel.objTabSettings) {
//        NSLog(@"%@",self.appDel.arrBusinessType);
//        lblOrderType.text=[self.appDel.arrBusinessType objectAtIndex:0];
//        bussinessType=0;
//    }else{
//        [self displayActivityWithMessage:@"Please wait"];
//        [self.appDel loadTabSettings:^(BOOL completed) {
//            [self dismissActivity];
//            NSLog(@"%@",self.appDel.arrBusinessType);
//            lblOrderType.text=[self.appDel.arrBusinessType objectAtIndex:0];
//            bussinessType=0;
//        }];
//    }
}

-(void)arrangeDataToDisplay
{
    
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
    NSInteger rowCount=0;
    
    if ([[[[self.appDel.arrBusinessType objectAtIndex:bussinessType] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"DELIVERY"]) {
        rowCount=self.appDel.arrDelivery.count;
    }
    if ([[[[self.appDel.arrBusinessType objectAtIndex:bussinessType] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"PICKUP"]) {
        rowCount=self.appDel.arrPickUp.count;
    }
    if ([[[[self.appDel.arrBusinessType objectAtIndex:bussinessType] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"RESERVATION"]) {
        rowCount=self.appDel.arrReservation.count;
    }
    
    return rowCount;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExploreTableViewCell *cell=(ExploreTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCellIdentifir];
    
    //down_arrow.png
    //right_arrow_explore.png
    
    if ([[[[self.appDel.arrBusinessType objectAtIndex:bussinessType] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"DELIVERY"]) {
        cell.txtContent.placeholder=[self.appDel.arrDelivery objectAtIndex:indexPath.row];
        NSLog(@"%@",[self.appDel.arrDelivery objectAtIndex:indexPath.row]);
        if ([[[cell.txtContent.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"ADDRESS"]) {
            cell.imgArrow.image=[UIImage imageNamed:@"right_arrow_explore.png"];
        }else{
            cell.imgArrow.image=[UIImage imageNamed:@"down_arrow.png"];
        }
    }
    if ([[[[self.appDel.arrBusinessType objectAtIndex:bussinessType] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"PICKUP"]) {
            cell.txtContent.placeholder=[self.appDel.arrPickUp objectAtIndex:indexPath.row];
        
        if ([[[cell.txtContent.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"ADDRESS"]) {
            cell.imgArrow.image=[UIImage imageNamed:@"right_arrow_explore.png"];
        }else{
            cell.imgArrow.image=[UIImage imageNamed:@"down_arrow.png"];
        }
    }
    if ([[[[self.appDel.arrBusinessType objectAtIndex:bussinessType] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"RESERVATION"]) {
        cell.txtContent.placeholder=[self.appDel.arrReservation objectAtIndex:indexPath.row];
        
        if ([[[cell.txtContent.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"ADDRESS"]) {
            cell.imgArrow.image=[UIImage imageNamed:@"right_arrow_explore.png"];
        }else{
            cell.imgArrow.image=[UIImage imageNamed:@"down_arrow.png"];
        }
    }
    
    if ([[[cell.txtContent.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"COUNTRY"]) {
        if (mySelectedCountry) {
            cell.txtContent.text=mySelectedCountry.strName;
        }else{
            cell.txtContent.text=@"";
        }
    }
    if ([[[cell.txtContent.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"CITY"]) {
        if (mySelectedCountry) {
            cell.txtContent.text=mySelectedCity.strName;
        }else{
            cell.txtContent.text=@"";
        }
    }
    if ([[[cell.txtContent.placeholder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString] isEqualToString:@"NEIGHBOURHOOD"]) {
        if (mySelectedCountry) {
            cell.txtContent.text=mySelectedColony.strName;
        }else{
            cell.txtContent.text=@"";
        }
    }
    
    
    cell.txtContent.tag=indexPath.row;
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}


-(IBAction)btnTypeSelectionPressed:(id)sender
{
    DeliveryTypeSelectorViewController *deliverySelector=[DeliveryTypeSelectorViewController sharedInstance];
    deliverySelector.view.frame=[[UIScreen mainScreen] bounds];
    deliverySelector.delegate=self;
    [self.navigationController.view addSubview:deliverySelector.view];
}

-(NSMutableArray*)dataSourceArray:(DeliveryTypeSelectorViewController *)controller
{
    
    return self.appDel.arrBusinessType;
}

-(void)didSelectedIndex:(NSInteger)selectedIndex
{
    DeliveryTypeSelectorViewController *deliverySelector=[DeliveryTypeSelectorViewController sharedInstance];
    [deliverySelector.view removeFromSuperview];
    lblOrderType.text=[self.appDel.arrBusinessType objectAtIndex:selectedIndex];
    bussinessType=selectedIndex;
    mySelectedCountry=nil;
    mySelectedCity=nil;
    [[BusinessTypeSelectorViewController sharedInstance] setBusiness:[self.appDel.arrBusinessType objectAtIndex:selectedIndex]];
    [tblDisplay reloadData];
}

-(NSString*)displayedTitle:(DeliveryTypeSelectorViewController *)controller
{
    return @"";
}

-(IBAction)btnFindResturantPressed:(id)sender
{
    [self performSegueWithIdentifier:@"ChooseAddressViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ChooseAddressViewController"]) {
        
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([[[textField.placeholder uppercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"COUNTRY"]) {
        [textField resignFirstResponder];
        CountrySelectionViewController *master=[CountrySelectionViewController sharedInstance];
        master.view.frame=[[UIScreen mainScreen] bounds];
        [self.view addSubview:master.view];
        master.delegate=self;
    }
    else if ([[[textField.placeholder uppercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"CITY"]){
        [textField resignFirstResponder];
        if (mySelectedCountry) {
            CitySelectionViewController *master=[CitySelectionViewController sharedInstance];
            master.view.frame=[[UIScreen mainScreen] bounds];
            [self.view addSubview:master.view];
            master.delegate=self;
        }else{
            [self displayErrorMessage:@"Please select the country first"];
        }
    }
    else if ([[[textField.placeholder uppercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"NEIGHBOURHOOD"]){
        [textField resignFirstResponder];
        if (mySelectedCountry && mySelectedCity) {
            ColonySelectionViewController *master=[ColonySelectionViewController sharedInstance];
            master.view.frame=[[UIScreen mainScreen] bounds];
            [self.view addSubview:master.view];
            master.delegate=self;
        }
    }
    else if ([[[textField.placeholder uppercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"ADDRESS"]){
        [tblDisplay scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:textField.tag inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        NSLog(@"%@",NSStringFromCGRect(textField.frame));
    }
}

-(void)didSelectedCountry:(ModelCountry *)selectedCountry
{
    mySelectedCountry=selectedCountry;
    self.appDel.objSelectedCountry=selectedCountry;
    CountrySelectionViewController *master=[CountrySelectionViewController sharedInstance];
    [master.view removeFromSuperview];
    [tblDisplay reloadData];
}

-(NSString*)selectedCountryID:(CitySelectionViewController *)controller
{
    return mySelectedCountry.strID;
}
-(void)didSelectedCity:(ModelCity *)selectedCity Controller:(CitySelectionViewController *)controller
{
    mySelectedCity=selectedCity;
    self.appDel.objSelectedCity=selectedCity;
    CitySelectionViewController *master=[CitySelectionViewController sharedInstance];
    [master.view removeFromSuperview];
    [tblDisplay reloadData];
}

-(NSString*)selectedCityID:(ColonySelectionViewController *)controller
{
    return mySelectedCity.strID;
}

-(void)didSelectedColony:(ModelColony *)selectedColony Controller:(ColonySelectionViewController *)controller
{
    mySelectedColony=selectedColony;
    self.appDel.objSelectedColony=selectedColony;
    ColonySelectionViewController *master=[ColonySelectionViewController sharedInstance];
    [master.view removeFromSuperview];
    [tblDisplay reloadData];
    
}

@end
