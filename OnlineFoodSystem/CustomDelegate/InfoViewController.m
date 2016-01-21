//
//  InfoViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 14/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "InfoViewController.h"
#import "BusinessInfoWebService.h"
#import "InfoSectionHeaderTableViewCell.h"
#import "ModelCatalogMenu.h"
#import "ModelPhotoGallery.h"
#import "ModelVideoGallery.h"
#import "CatalogMenuTableViewCell.h"

typedef NS_ENUM(NSUInteger, INFO_SECTION) {
    CATALOG,
    DELIVERY_LOCATION,
    ABOUT_RESTURANT,
    PHOTO_GALLERY,
    VIDEO_GALLERY,
    TOTAL_SECTION,
};

NSString static *strTableSectionContent[]={
    [CATALOG]=@"CATALOG: Opening time",
    [DELIVERY_LOCATION]=@"Delivery Location",
    [ABOUT_RESTURANT]=@"About Resturant",
    [PHOTO_GALLERY]=@"Photo Gallery",
    [VIDEO_GALLERY]=@"Video Gallery",
};

@interface InfoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    NSMutableArray *arrCatalogmenu;
    NSMutableArray *arrPhotoGallery;
    NSMutableArray *arrVideoGallery;
    
    IBOutlet UITableView *tblDisplay;
}

@end

@implementation InfoViewController

+(InfoViewController*)sharedInstance
{
    static InfoViewController *infoController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        infoController=[[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    });
    return infoController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[BusinessInfoWebService service] callBusinessInfoWebServiceForBusinessID:[self.delegate selectedBusinessInfoController:self].strID WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
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
            //[@"arrCatalogMenu",@"arrPhotogallery",@"arrVideoGallery"]
            NSDictionary *dictResponse=(NSDictionary*)result;
            arrCatalogmenu=[[dictResponse objectForKey:@"arrCatalogMenu"] mutableCopy];
            arrPhotoGallery=[[dictResponse objectForKey:@"arrPhotogallery"] mutableCopy];
            arrVideoGallery=[[dictResponse objectForKey:@"arrVideoGallery"] mutableCopy];
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
    return TOTAL_SECTION;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==CATALOG) {
        return arrCatalogmenu.count;
    }
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *strSectionHeader=@"MySectionHeader";
    InfoSectionHeaderTableViewCell *cell=(InfoSectionHeaderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strSectionHeader];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"InfoSectionHeaderTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.lblContent.text=strTableSectionContent[section];
    cell.btn.tag=section;
    [cell.btn addTarget:self action:@selector(sectionHeaderTapped:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell=nil;
    static NSString *strCell=@"MyCell";
    if (indexPath.section==CATALOG) {
        CatalogMenuTableViewCell *cell=(CatalogMenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
        if (!cell) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"CatalogMenuTableViewCell" owner:self options:nil] objectAtIndex:0];
        }
        
        ModelCatalogMenu *obj=[arrCatalogmenu objectAtIndex:indexPath.row];
        
        cell.lblLeft.text=[obj.strName capitalizedString];
        cell.lblMiddle.text=[obj.strDays capitalizedString];
        cell.lblRight.text=[obj.strOpenCloseTime capitalizedString];
        
        cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        myCell=cell;
    }
    return myCell;
}


-(void)sectionHeaderTapped:(UIButton*)btn
{
    
}




@end
