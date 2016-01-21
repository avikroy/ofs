//
//  ColonySelectionViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ColonySelectionViewController.h"
#import "ColonyWebService.h"

@interface ColonySelectionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrDisplay;
}

@end

@implementation ColonySelectionViewController

+(ColonySelectionViewController*)sharedInstance
{
    static ColonySelectionViewController *colonySelectionController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colonySelectionController = [[ColonySelectionViewController alloc] initWithNibName:@"ColonySelectionViewController" bundle:nil];
    });
    return colonySelectionController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[ColonyWebService service] callColonyServiceForCityID:[self.delegate selectedCityID:self] WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
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
    
    ModelColony *objColony=arrDisplay[indexPath.row];
    cell.textLabel.text=[objColony.strName capitalizedString];
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedColony:Controller:)]) {
        [self.delegate didSelectedColony:arrDisplay[indexPath.row] Controller:self];
    }
}

@end
