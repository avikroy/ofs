//
//  FilterViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 11/11/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterTableViewCell.h"
#import "FilterDistanceTableViewCell.h"
#import "FilterButtonTableViewCell.h"
#import "BusinessTypeSelectorViewController.h"

typedef NS_ENUM(NSUInteger, CellContent) {
    OpenNow,
    FreeDelivery,
    OffersCoupon,
    ShowMap,
    Distance,
    Cusines,
    Button,
    TOTAL,
};

NSString static *strCellContent[]={
    [OpenNow]=@"Open Now",
    [FreeDelivery]=@"Free Delivery",
    [OffersCoupon]=@"Offers Coupon",
    [ShowMap]=@"Show Map",
    [Distance]=@"Distance",
    [Cusines]=@"Cusinies",
    [Button]=@"APPLY",
};

@interface FilterViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UIButton *btnReset;
    IBOutlet UITableView *tblDisplay;
    IBOutlet UIView *vwMiddle;
    
    NSMutableArray *arrToggle;
    
    BOOL isOpen;
    BOOL isFreeDelivery;
    BOOL isOfferCoupon;
    BOOL isShowMap;
    NSInteger distance;
    NSString *strSelectedCuisines;
}

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    btnReset.layer.borderWidth=1.0f;
    btnReset.layer.borderColor=[UIColor colorWithRed:248.0f/255.0f green:215.0f/255.0f blue:215.0f/255.0f alpha:1.0f].CGColor;
    
    arrToggle=[NSMutableArray array];
    [arrToggle insertObject:@0 atIndex:OpenNow];
    [arrToggle insertObject:@0 atIndex:FreeDelivery];
    [arrToggle insertObject:@0 atIndex:OffersCoupon];
    [arrToggle insertObject:@0 atIndex:ShowMap];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BusinessTypeSelectorViewController *businessTypeSelector=[BusinessTypeSelectorViewController  sharedInstance];
    [self addChildViewController:businessTypeSelector];
    businessTypeSelector.view.frame=CGRectMake(0, 0, vwMiddle.frame.size.width, vwMiddle.frame.size.height);
    [vwMiddle addSubview:businessTypeSelector.view];
    [businessTypeSelector didMoveToParentViewController:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    BusinessTypeSelectorViewController *businessTypeSelector=[BusinessTypeSelectorViewController  sharedInstance];
    [businessTypeSelector.view layoutIfNeeded];
}

-(void)resetStatus
{
    isOpen=NO;
    isFreeDelivery=NO;
    isOfferCoupon=NO;
    isShowMap=NO;
    distance=10;
    strSelectedCuisines=@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return TOTAL;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height=0.0f;
    if (indexPath.row==Distance) {
        height=80.0f;
    }
    else if (indexPath.row==Cusines){
        height=90.0f;
    }
    else if (indexPath.row==Button){
        height=70.0f;
    }
    else{
        height=55.0f;
    }
    return height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell=nil;
    if (indexPath.row==Distance) {
        static NSString *cellIdentifier=@"FilterDistanceTableViewCell";
        FilterDistanceTableViewCell *cell=(FilterDistanceTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell=[[FilterDistanceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            [cell.btn1 addTarget:self action:@selector(btnDistancePressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.btn1.tag=1;

            [cell.btn2 addTarget:self action:@selector(btnDistancePressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.btn2.tag=2;
            
            [cell.btn3 addTarget:self action:@selector(btnDistancePressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.btn3.tag=5;
            
            [cell.btn4 addTarget:self action:@selector(btnDistancePressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.btn4.tag=7;
            
            [cell.btn5 addTarget:self action:@selector(btnDistancePressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.btn5.tag=10;
        }
        myCell=cell;
    }
    else if (indexPath.row==Cusines){
        static NSString *cellIdentifier=@"FilterButtonTableViewCell";
        FilterButtonTableViewCell *cell=(FilterButtonTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell=[[FilterButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.lblContent.text=strCellContent[indexPath.row];
        cell.lblText.text=@"All";
        cell.btn.layer.borderWidth=1.0f;
        cell.btn.layer.borderColor=[UIColor colorWithRed:252.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0f].CGColor;
        [cell.btn addTarget:self action:@selector(btnCusiniesPressed:) forControlEvents:UIControlEventTouchUpInside];
        myCell=cell;
    }
    else if (indexPath.row==Button){
        static NSString *cellIdentifier=@"FilterButtonTableViewCell";
        FilterButtonTableViewCell *cell=(FilterButtonTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell=[[FilterButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.lblContent.text=@"";
        cell.lblText.text=@"";
        cell.lblContent.hidden=cell.lblText.hidden=YES;
        cell.imgArrow.hidden=YES;
        [cell.btn setTitle:strCellContent[Button] forState:UIControlStateNormal];
        cell.btn.backgroundColor=[UIColor colorWithRed:243.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
        cell.consHeight.constant=0.0f;
        [cell.btn addTarget:self action:@selector(btnApplyPressed:) forControlEvents:UIControlEventTouchUpInside];
        myCell=cell;
    }
    
    else{
        static NSString *cellIdentifier=@"FilterTableViewCell";
        FilterTableViewCell *cell=(FilterTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell=[[FilterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.lblContent.text=strCellContent[indexPath.row];
        [cell.btn addTarget:self action:@selector(btnTogglePressed:) forControlEvents:UIControlEventTouchUpInside];
        cell.btn.tag=indexPath.row;
        
        if ([[arrToggle objectAtIndex:indexPath.row] isEqual:@0]) {
            cell.imgOnOff.image=[UIImage imageNamed:@"off_btn.png"];
            cell.lblOn.hidden=YES;
            cell.lblOff.hidden=NO;
        }else{
            cell.imgOnOff.image=[UIImage imageNamed:@"on_btn.png"];
            cell.lblOn.hidden=NO;
            cell.lblOff.hidden=YES;
        }
        
        myCell=cell;
    }
    
    myCell.backgroundColor=myCell.contentView.backgroundColor=[UIColor clearColor];
    myCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return myCell;
}


-(void)btnTogglePressed:(UIButton*)btn
{
    if ([[arrToggle objectAtIndex:btn.tag] isEqual:@0]) {
        [arrToggle removeObjectAtIndex:btn.tag];
        [arrToggle insertObject:@1 atIndex:btn.tag];
    }else{
        [arrToggle removeObjectAtIndex:btn.tag];
        [arrToggle insertObject:@0 atIndex:btn.tag];
    }
    
    /*
    switch (btn.tag) {
        case OpenNow:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(filterOpenStatus:Controller:)]) {
                    [self.delegate filterOpenStatus:NO Controller:self];
                }
            }else{
                [self.delegate filterOpenStatus:YES Controller:self];
            }
            break;
        case FreeDelivery:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(flterFreeDeliveryStatus:Controller:)]) {
                    [self.delegate flterFreeDeliveryStatus:NO Controller:self];
                }
            }else{
                [self.delegate flterFreeDeliveryStatus:YES Controller:self];
            }
        case OffersCoupon:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(filterOfferCouponStatus:Controller:)]) {
                    [self.delegate filterOfferCouponStatus:NO Controller:self];
                }
            }else{
                [self.delegate filterOfferCouponStatus:YES Controller:self];
            }
        case ShowMap:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(filterShowMap:Controller:)]) {
                    [self.delegate filterShowMap:NO Controller:self];
                }
            }else{
                [self.delegate filterShowMap:YES Controller:self];
            }
            
        default:
            break;
    }
     */
    
    switch (btn.tag) {
        case OpenNow:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                isOpen=NO;
            }else{
                isOpen=YES;
            }
            break;
        case FreeDelivery:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                isFreeDelivery=NO;
            }else{
                isFreeDelivery=YES;
            }
            break;
        case OffersCoupon:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                isOfferCoupon=NO;
            }else{
                isOfferCoupon=YES;
            }
            break;
        case ShowMap:
            if ([arrToggle[btn.tag] isEqual:@0]) {
                isShowMap=NO;
            }else{
                isShowMap=YES;
            }
            break;
            
        default:
            break;
    }
    
    [tblDisplay reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:btn.tag inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)btnDistancePressed:(UIButton*)btn
{
    /*
    if (self.delegate && [self.delegate respondsToSelector:@selector(filterSeletectedDistance:Controller:)]) {
        [self.delegate filterSeletectedDistance:btn.tag Controller:self];
    }
    */
    distance=btn.tag;
}

-(void)btnCusiniesPressed:(UIButton*)btn
{
    /*
    if (self.delegate && [self.delegate respondsToSelector:@selector(filterSelectedCusinies:Controller:)]) {
        [self.delegate filterSelectedCusinies:strSelectedCuisines Controller:self];
    }
    */
    
    strSelectedCuisines=@"";
}

-(void)btnApplyPressed:(UIButton*)btn
{
    /*
    if (self.delegate && [self.delegate respondsToSelector:@selector(filterApplyPressed:)]) {
        [self.delegate filterApplyPressed:self];
    }
    */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FilterApplyed" object:nil userInfo:[NSDictionary dictionaryWithObjects:@[[NSNumber numberWithBool:isOpen],[NSNumber numberWithBool:isFreeDelivery],[NSNumber numberWithBool:isOfferCoupon],[NSNumber numberWithBool:isShowMap],[NSNumber numberWithInteger:distance],strSelectedCuisines] forKeys:@[@"OpenNow",@"FreeDelivery",@"OffersCoupon",@"ShowMap",@"Distance",@"Cusinies"]]];
}

-(IBAction)btnResetPressed:(id)sender
{
    [self resetStatus];
}


@end
