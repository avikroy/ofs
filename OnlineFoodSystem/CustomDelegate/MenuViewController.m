//
//  MenuViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "MenuViewController.h"
#import "BusinessMenuWebService.h"
#import "AppDelegate.h"
#import "BusinessTypeSelectorViewController.h"
#import "CustomAcitivityViewController.h"
#import "MenuTableViewCell.h"

@interface MenuViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrDisplay;
}

@end

@implementation MenuViewController

+(MenuViewController*)sharedInstance
{
    static MenuViewController *menuController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menuController=[[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    });
    return menuController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    AppDelegate *appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    [[BusinessMenuWebService service] callBusinessMenuWebServiceForBusinessID:[self.delegate selectedBusinessMenuController:self].strID DeliveryType:[[BusinessTypeSelectorViewController sharedInstance] business_type] CountryID:appDel.objSelectedCountry.strID CityID:appDel.objSelectedCity.strID DeliveryNeighbourStatus:@"0" Currency:@"USD" GA:@"" CityName:appDel.objSelectedCity.strName CollectionType:[[BusinessTypeSelectorViewController sharedInstance] business_type] ReserveStatus:[[BusinessTypeSelectorViewController sharedInstance] business_type] Address:appDel.strSelectedAddress Resturant:@"" Cusinies:@"" RHour:@"-1" RMin:@"-1" Latitude:[NSString stringWithFormat:@"%f",appDel.coordinateSelected.latitude] Longitude:[NSString stringWithFormat:@"%f",appDel.coordinateSelected.longitude] ZipCode:appDel.strSelectedZipCode Zoom:@"-1" Approved:YES WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }];
            [alertController addAction:actionOK];
            [self presentViewController:alertController animated:YES completion:^{
                
            }];
        }else{
            //NSDictionary *dictResult=[NSDictionary dictionaryWithObjects:@[arrMenuList,arrCategoryNameID] forKeys:@[@"arrMenuList",@"arrCategoryNameID"]];
            arrDisplay=[(NSDictionary*)result objectForKey:@"arrCategoryNameID"];
            [tblDisplay reloadData];
            
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!arrDisplay) {
        return 0;
    }
    return arrDisplay.count+1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell=@"myCell";
    
    MenuTableViewCell *cell=(MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"MenuTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    if (indexPath.row==0) {
        cell.lblContent.text=@"Most Popular Dishes";
    }else{
        cell.lblContent.text=[(NSString*)[(NSDictionary*)[arrDisplay objectAtIndex:indexPath.row-1] objectForKey:@"name"] capitalizedString];
    }
    
    cell.btnDisclouse.tag=indexPath.row;
    [cell.btnDisclouse addTarget:self action:@selector(btnDisclousePressed:) forControlEvents:UIControlEventTouchUpInside];
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell=(MenuTableViewCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell.btnDisclouse sendActionsForControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)btnDisclousePressed:(UIButton*)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedCategoryID:IndexPathRow:Controller:)]) {
        [self.delegate didSelectedCategoryID:(btn.tag==0)?nil:[(NSString*)[(NSDictionary*)[arrDisplay objectAtIndex:btn.tag-1] objectForKey:@"id"] capitalizedString] IndexPathRow:btn.tag Controller:self];
    }
}




@end
