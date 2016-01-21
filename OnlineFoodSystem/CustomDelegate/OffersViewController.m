//
//  OffersViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "OffersViewController.h"
#import "OffersTableViewCell.h"
#import "BusinessDiscountWebService.h"
#import "ModelBusinessOffer.h"

@interface OffersViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrResponse;
}

@end

@implementation OffersViewController

+(OffersViewController*)sharedInstance
{
    static OffersViewController *offersController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        offersController=[[OffersViewController alloc] initWithNibName:@"OffersViewController" bundle:nil];
    });
    return offersController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    tblDisplay.estimatedRowHeight=90.0f;
    tblDisplay.rowHeight=UITableViewAutomaticDimension;
    
    [[BusinessDiscountWebService service] callBusinessInfoWebServiceForBusinessID:[self.delegate selectedBusinessOffersController:self].strID WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:@"Reviews can't be fetched right now, please try again later." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }];
            [alertController addAction:actionOK];
            [self presentViewController:alertController animated:YES completion:^{
                
            }];
        }else{
            arrResponse=(NSMutableArray*)result;
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
    return arrResponse.count+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell=@"myCell";
    OffersTableViewCell *cell=(OffersTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"OffersTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    if (indexPath.row==0) {
        cell.lblOfferName.text=@"Offer Name";
        cell.lblOfferPrice.text=@"Offer Price";
        cell.lblStartDate.text=@"Start Date";
        cell.lblEndDate.text=@"End Date";
        cell.imgBG.backgroundColor=[UIColor colorWithRed:249.0f/255.0f green:249.0f/255.0f blue:249.0f/255.0f alpha:1.0f];
    }else{
        
        ModelBusinessOffer *obj=[arrResponse objectAtIndex:indexPath.row-1];
        
        cell.lblOfferName.text=obj.strDiscountText;
        cell.lblOfferPrice.text=obj.strMinShop;
        cell.lblStartDate.text=obj.strStartDate;
        cell.lblEndDate.text=obj.strEndDate;
    }
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

@end
