//
//  CategoryViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

@import Foundation;
#import "ModelBusiness.h"

@implementation NSMutableArray (BusinessSearching)

-(NSMutableArray*)getSearchedArrayForSearchKeyText:(NSString*)strText
{
    NSMutableArray *arrResult=[NSMutableArray array];
    if ([strText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        for (ModelBusiness *obj in self) {
            if ([obj.strName localizedCaseInsensitiveContainsString:strText]) {
                [arrResult addObject:obj];
            }
        }
    }else{
        arrResult=[NSMutableArray arrayWithArray:self];
    }
    return arrResult;
}

@end


#import "CategoryViewController.h"
#import "CategoryListViewController.h"
#import "CategoryMapViewController.h"
#import "AllBusinessWebService.h"
#import "ModelCategoryCustom.h"
#import "FilterViewController.h"
#import "BusinessDetailsViewController.h"

@interface CategoryViewController ()<CategoryListViewControllerDelegate,CategoryMapViewControllerDelegate,UISearchBarDelegate/*,FilterViewControllerDelegate*/>
{
    @private
    IBOutlet UIView *vwBottom;
    IBOutlet UISearchBar *searchBar;
    IBOutlet UIButton *btnToggle;
    IBOutlet UILabel *lblAddress;
    IBOutlet UIImageView *imgDisplayType;
    
    CategoryListViewController *listController;
    CategoryMapViewController *mapController;
    
    NSMutableArray *arrOriginalResponse;
    NSMutableArray *arrDisplay;
    
    BOOL isListVisible;
    
    ModelBusiness *objSelectedBusiness;
}

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    lblAddress.text=self.strAddress;
    
    for(UIView *subView in searchBar.subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {
            UITextField *searchField = (UITextField *)subView;
            searchField.font = [UIFont fontWithName:searchField.font.fontName size:11];
        }
        subView.backgroundColor=[UIColor clearColor];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(filteredApply:) name:@"FilterApplyed" object:nil];
    
    listController=[CategoryListViewController sharedInstance];
    [self addChildViewController:listController];
    listController.view.frame=CGRectMake(0, 0, vwBottom.frame.size.width, vwBottom.frame.size.height);
    [vwBottom addSubview:listController.view];
    [listController didMoveToParentViewController:self];
    listController.delegate=self;
    isListVisible=YES;
    
    
    mapController=[CategoryMapViewController sharedInstance];
    [self addChildViewController:mapController];
    mapController.view.frame=CGRectMake(0, 0, vwBottom.frame.size.width, vwBottom.frame.size.height);
    [vwBottom addSubview:mapController.view];
    [mapController didMoveToParentViewController:self];
    mapController.view.hidden=YES;
    mapController.delegate=self;
    
    [self displayActivityWithMessage:@"Please Wait..."];
    [[AllBusinessWebService service] callAllBusinessWebServiceForLatitude:[NSString stringWithFormat:@"%f",self.appDel.coordinateSelected.latitude] Longitude:[NSString stringWithFormat:@"%f",self.appDel.coordinateSelected.longitude] ZipCode:(self.appDel.strSelectedZipCode.length>0)?self.appDel.strSelectedZipCode:@"-1" Zoom:@"15" BusinessType:[[[BusinessTypeSelectorViewController sharedInstance] business_type] lowercaseString] Category:@"" SelectedCityID:self.appDel.objSelectedCity.strID Filter:false SelectedCountryID:self.appDel.objSelectedCountry.strID DeliveryNeighbourhoodStatus:0 Currency:@"USD" GA:@"" CityName:self.appDel.objSelectedCity.strName CollectType:[[[BusinessTypeSelectorViewController sharedInstance] business_type] lowercaseString] Reservations:[[[BusinessTypeSelectorViewController sharedInstance] business_type] lowercaseString] Address:(self.appDel.strSelectedAddress.length>0)?self.appDel.strSelectedAddress:@"" Approved:YES Resturent:@"" Cuisines:@"" RHour:@"-1" RMin:@"-1" WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        [self dismissActivity];
        if (isError) {
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:^{
                    
                }];
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [alertController addAction:actionOK];
            [self presentViewController:alertController animated:YES completion:^{
                
            }];
        }else{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dictResponse=(NSDictionary*)result;
                self.appDel.arrCategory=[dictResponse objectForKey:@"categories"];
                self.appDel.arrCategoryCustom=[dictResponse objectForKey:@"categoriesCustom"];
                if (self.appDel.arrCategoryCustom.count>0) {
                    self.appDel.dictCategoryCustome=[NSMutableDictionary dictionary];
                    for (ModelCategoryCustom *objCategoryCustom in self.appDel.arrCategoryCustom) {
                        [self.appDel.dictCategoryCustome setObject:objCategoryCustom forKey:objCategoryCustom.strID];
                    }
                }else{
                    self.appDel.dictCategoryCustome=[NSMutableDictionary dictionary];
                }
                arrOriginalResponse=[dictResponse objectForKey:@"business"];
                arrDisplay=[NSMutableArray arrayWithArray:(NSArray*)arrOriginalResponse];
                if (!arrDisplay) {
                    arrDisplay=[NSMutableArray array];
                }
                [[NSNotificationCenter defaultCenter] postNotificationName:@"BusinessValueReceived" object:nil];
                imgDisplayType.image=[UIImage imageNamed:@"list_icon.png"];
            }else{
                arrDisplay=[NSMutableArray array];
            }
        }
    }];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"FilterApplyed" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSMutableArray*)getListDataSource:(CategoryListViewController *)controller
{
    return arrDisplay;
}

-(NSMutableArray*)getMapDataSource:(CategoryMapViewController *)controller
{
    return arrDisplay;
}


-(IBAction)btnTogglePressed:(id)sender
{
    if (isListVisible) {
        listController.view.hidden=YES;
        mapController.view.hidden=NO;
        isListVisible=NO;
        imgDisplayType.image=[UIImage imageNamed:@"map_icon.png"];
    }else{
        listController.view.hidden=NO;
        mapController.view.hidden=YES;
        isListVisible=YES;
        imgDisplayType.image=[UIImage imageNamed:@"list_icon.png"];
    }
}

-(IBAction)btnFilterPressed:(id)sender
{
    [self performSegueWithIdentifier:@"FilterViewController" sender:self];
}

/*
-(void)filterOpenStatus:(BOOL)isOpen Controller:(FilterViewController*)controller
{
    
}

-(void)flterFreeDeliveryStatus:(BOOL)isFreeDelivery Controller:(FilterViewController*)controller
{
    
}

-(void)filterOfferCouponStatus:(BOOL)isCoupon Controller:(FilterViewController*)controller
{
    
}

-(void)filterShowMap:(BOOL)isMap Controller:(FilterViewController*)controller
{
    
}

-(void)filterSeletectedDistance:(NSInteger)distance Controller:(FilterViewController*)cntroller
{
    
}

-(void)filterSelectedCusinies:(NSString*)strSelectedCusinies Controller:(FilterViewController*)controller
{
    
}

-(void)filterApplyPressed:(FilterViewController*)controller
{
    
}
*/

-(void)filteredApply:(NSNotification*)notification
{
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //NSLog(@"Search Text = %@",searchText);
    arrDisplay=[arrOriginalResponse getSearchedArrayForSearchKeyText:searchText];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BusinessValueReceived" object:nil];
}


-(void)didSelectedCategoryIndex:(NSInteger)selectedIndex Controller:(CategoryListViewController *)controller
{
    objSelectedBusiness=[arrDisplay objectAtIndex:selectedIndex];
    [self performSegueWithIdentifier:@"BusinessDetailsViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"BusinessDetailsViewController"]) {
        BusinessDetailsViewController *master=segue.destinationViewController;
        master.objSelectedBusiness=objSelectedBusiness;
        self.appDel.objBusiness=objSelectedBusiness;
    }
    else if ([segue.identifier isEqualToString:@"FilterViewController"]) {
        
    }
}

@end
