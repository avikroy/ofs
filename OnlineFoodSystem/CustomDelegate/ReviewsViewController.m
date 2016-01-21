//
//  ReviewsViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ReviewsViewController.h"
#import "ReviewsSectionHeaderTableViewCell.h"
#import "ReviewsTableViewCell.h"
#import "BusinessReviewWebService.h"
#import "ModelBusinessReview.h"

@interface ReviewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrResponse;
}

@end

@implementation ReviewsViewController

+(ReviewsViewController*)sharedInstance
{
    static ReviewsViewController *reviewsController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reviewsController=[[ReviewsViewController alloc] initWithNibName:@"ReviewsViewController" bundle:nil];
    });
    return reviewsController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[BusinessReviewWebService service] callBusinessInfoWebServiceForBusinessID:[self.delegate selectedBusinessReviewsController:self].strID WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
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
    return arrResponse.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *strHeaderIdentifer=@"strHeaderIdentifer";
    ReviewsSectionHeaderTableViewCell *cell=(ReviewsSectionHeaderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strHeaderIdentifer];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ReviewsSectionHeaderTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    ModelBusinessReview *objReview=[arrResponse objectAtIndex:section];
    cell.lblUserType.text=objReview.strUser;
    cell.lblDate.text=objReview.strPDate;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell=@"MyCell";
    ReviewsTableViewCell *cell=(ReviewsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ReviewsTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    ModelBusinessReview *obj=[arrResponse objectAtIndex:indexPath.section];
    if (indexPath.row==0) {
        cell.lblLeft.text=@"Quality of Food";
        cell.lblRight.text=[NSString stringWithFormat:@"%@ Out of 5",obj.strQuality];
        [cell.vwRating setRating:[[obj.strQuality stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]];
    }
    if (indexPath.row==1) {
        cell.lblLeft.text=@"Punctuality";
        cell.lblRight.text=[NSString stringWithFormat:@"%@ Out of 5",obj.strDelivery];
        [cell.vwRating setRating:[[obj.strDelivery stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]];
    }
    if (indexPath.row==2) {
        cell.lblLeft.text=@"Service";
        cell.lblRight.text=[NSString stringWithFormat:@"%@ Out of 5",obj.strDealer];
        [cell.vwRating setRating:[[obj.strDealer stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]];
    }
    if (indexPath.row==3) {
        cell.lblLeft.text=@"Food Packaging";
        cell.lblRight.text=[NSString stringWithFormat:@"%@ Out of 5",obj.strPackage];
        [cell.vwRating setRating:[[obj.strPackage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]];
    }
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}


@end
