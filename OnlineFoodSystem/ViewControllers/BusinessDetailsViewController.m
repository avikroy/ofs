//
//  BusinessDetailsViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 13/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BusinessDetailsViewController.h"
#import "BusinessTabViewController.h"
#import "MenuViewController.h"
#import "InfoViewController.h"
#import "ReviewsViewController.h"
#import "OffersViewController.h"

#import "MenuDetailsViewController.h"
#import "ModelDishes.h"

@interface BusinessDetailsViewController ()<UIScrollViewDelegate,BusinessTabViewControllerDelegate,MenuViewControllerDelegate,InfoViewControllerDelegate,ReviewsViewControllerDelegate,OffersViewControllerDelegate>
{
    @private
    IBOutlet UILabel *lblHeader;
    IBOutlet UIImageView *imgProduct;
    IBOutlet UIView *vwTab;
    IBOutlet UIView *vwCommonSectionContainer;
    IBOutlet UIScrollView *scrollPage;
    
    NSMutableArray *arrPass;
}

@end

@implementation BusinessDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *dataImg=[NSData dataWithContentsOfURL:[NSURL URLWithString:self.objSelectedBusiness.strHeaderURL]];
        if (dataImg.length>0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                imgProduct.image=[UIImage imageWithData:dataImg];
            });
        }
    });
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    BusinessTabViewController *tabController=[BusinessTabViewController sharedInstance];
    [self addChildViewController:tabController];
    tabController.view.frame=CGRectMake(0, 0, vwTab.frame.size.width, vwTab.frame.size.height);
    [vwTab addSubview:tabController.view];
    [tabController didMoveToParentViewController:self];
    tabController.delegate=self;
    
    MenuViewController *menu=[MenuViewController sharedInstance];
    menu.delegate=self;
    menu.view.frame=CGRectMake(vwCommonSectionContainer.frame.size.width*0, 0, vwCommonSectionContainer.frame.size.width, vwCommonSectionContainer.frame.size.height);
    [scrollPage addSubview:menu.view];
    
    InfoViewController *info=[InfoViewController sharedInstance];
    info.delegate=self;
    info.view.frame=CGRectMake(vwCommonSectionContainer.frame.size.width*1, 0, vwCommonSectionContainer.frame.size.width, vwCommonSectionContainer.frame.size.height);
    [scrollPage addSubview:info.view];
    
    ReviewsViewController *reviews=[ReviewsViewController sharedInstance];
    reviews.delegate=self;
    reviews.view.frame=CGRectMake(vwCommonSectionContainer.frame.size.width*2, 0, vwCommonSectionContainer.frame.size.width, vwCommonSectionContainer.frame.size.height-10);
    [scrollPage addSubview:reviews.view];
    
    OffersViewController *offer=[OffersViewController sharedInstance];
    offer.delegate=self;
    offer.view.frame=CGRectMake(vwCommonSectionContainer.frame.size.width*3, 0, vwCommonSectionContainer.frame.size.width, vwCommonSectionContainer.frame.size.height);
    [scrollPage addSubview:offer.view];
    
    scrollPage.frame=CGRectMake(0, 0, vwCommonSectionContainer.frame.size.width, vwCommonSectionContainer.frame.size.height);
    scrollPage.contentSize=CGSizeMake(scrollPage.frame.size.width*4, scrollPage.frame.size.height);
    [scrollPage setPagingEnabled:YES];
    [scrollPage setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView==scrollPage) {
        int page = scrollView.contentOffset.x / scrollView.frame.size.width;
        NSLog(@"Page no=%d",page);
        [[BusinessTabViewController sharedInstance] setSelectedTab:page];
    }
}

-(void)didSelectedMenu:(BusinessTabViewController*)controller
{
    [scrollPage setContentOffset:CGPointMake(vwCommonSectionContainer.frame.size.width*0, 0) animated:YES];
}
-(void)didSelectedInfo:(BusinessTabViewController*)controller
{
    [scrollPage setContentOffset:CGPointMake(vwCommonSectionContainer.frame.size.width*1, 0) animated:YES];
}
-(void)didSelectedReviews:(BusinessTabViewController*)controller
{
    [scrollPage setContentOffset:CGPointMake(vwCommonSectionContainer.frame.size.width*2, 0) animated:YES];
}
-(void)didSelectedOffers:(BusinessTabViewController*)controller
{
    [scrollPage setContentOffset:CGPointMake(vwCommonSectionContainer.frame.size.width*3, 0) animated:YES];
}


-(IBAction)btnBackPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(ModelBusiness*)selectedBusinessMenuController:(MenuViewController *)controller
{
    return self.objSelectedBusiness;
}

-(ModelBusiness*)selectedBusinessInfoController:(InfoViewController *)controller
{
    return self.objSelectedBusiness;
}

-(ModelBusiness*)selectedBusinessReviewsController:(ReviewsViewController *)controller
{
    return self.objSelectedBusiness;
}

-(ModelBusiness*)selectedBusinessOffersController:(OffersViewController *)controller
{
    return self.objSelectedBusiness;
}

-(void)didSelectedCategoryID:(NSString *)strCategoryID IndexPathRow:(NSInteger)row Controller:(MenuViewController *)controller
{
    if (row==0) {
        arrPass=self.appDel.arrFavouriteCategory;
    }else{
        if (arrPass) {
            arrPass=nil;
        }
        arrPass=[NSMutableArray array];
        for (ModelDishes *objDishes in self.appDel.arrCategory) {
            if ([[objDishes.strCategoryID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:[strCategoryID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]) {
                [arrPass addObject:objDishes];
            }
        }
    }
    [self performSegueWithIdentifier:@"MenuDetailsViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MenuDetailsViewController"]) {
        MenuDetailsViewController *master=segue.destinationViewController;
        master.arrDisplay=arrPass;
    }
}

@end
