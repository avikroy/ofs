//
//  CountrySelectionViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 06/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CountrySelectionViewController.h"
#import "CountryWebService.h"
#import "ModelCountry.h"
#import "SVProgressHUD.h"

@interface CountrySelectionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    NSMutableArray *arrDisplay;
    
}

@end

@implementation CountrySelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    tblDisplay.estimatedRowHeight=40.0f;
    tblDisplay.rowHeight=UITableViewAutomaticDimension;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SVProgressHUD showWithStatus:@"Please Wait..."];
    [[CountryWebService service] callCountryServiceWithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        [SVProgressHUD dismiss];
        if (isError) {
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:@"Something is wrong, please try again later." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }];
            [alertController addAction:actionOK];
            [self presentViewController:alertController animated:YES completion:^{
                
            }];
        }else{
            arrDisplay=(NSMutableArray*)result;
            [tblDisplay reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(CountrySelectionViewController*)sharedInstance
{
    static CountrySelectionViewController *countrySelectionViewController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        countrySelectionViewController=[[CountrySelectionViewController alloc] initWithNibName:@"CountrySelectionViewController" bundle:nil];
    });
    return countrySelectionViewController;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrDisplay.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strMyCell=@"MyCell";
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strMyCell];
    ModelCountry *objCountry=arrDisplay[indexPath.row];
    cell.textLabel.text=[objCountry.strName capitalizedString];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedCountry:)]) {
        [self.delegate didSelectedCountry:(ModelCountry*)[arrDisplay objectAtIndex:indexPath.row]];
    }
}


@end
