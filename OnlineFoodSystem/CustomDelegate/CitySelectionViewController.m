//
//  CitySelectionViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "CitySelectionViewController.h"
#import "CityWebservice.h"
#import "SVProgressHUD.h"

@interface CitySelectionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    NSMutableArray *arrDisplay;
    IBOutlet UITableView *tblDisplay;
}

@end

@implementation CitySelectionViewController

+(CitySelectionViewController*)sharedInstance
{
    static CitySelectionViewController *citySelectionViewController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        citySelectionViewController=[[CitySelectionViewController alloc] initWithNibName:@"CitySelectionViewController" bundle:nil];
    });
    return citySelectionViewController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    tblDisplay.estimatedRowHeight=45.0f;
    tblDisplay.rowHeight=UITableViewAutomaticDimension;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SVProgressHUD showWithStatus:@"Please Wait..."];
    [[CityWebservice service] callCityServiceForCountryID:[self.delegate selectedCountryID:self] WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
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
    static NSString *str=@"MyCell";
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    
    ModelCity *objCity=arrDisplay[indexPath.row];
    cell.textLabel.text=[objCity.strName capitalizedString];
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedCity:Controller:)]) {
        [self.delegate didSelectedCity:arrDisplay[indexPath.row] Controller:self];
    }
}


@end
