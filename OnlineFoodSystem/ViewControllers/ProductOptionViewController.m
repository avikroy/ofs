//
//  ProductOptionViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 15/12/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "ProductOptionViewController.h"
#import "ProductOptionWebService.h"
#import "ProductCheckTableViewCell.h"
#import "ProductRadioTableViewCell.h"
#import "ProductSpecialInstructionTableViewCell.h"
#import "ProductAddTableViewCell.h"

@interface ProductOptionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    IBOutlet UILabel *lblPageHeader;
    
    NSMutableArray *arrOuterOption;
    NSMutableArray *arrInnerOption;
    
    CGFloat totalPrice;
    NSIndexPath *prevIndexPath;
    
    NSInteger orderCount;
}

@end

@implementation ProductOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tblDisplay.estimatedRowHeight=30.0f;
    tblDisplay.rowHeight=UITableViewAutomaticDimension;
    orderCount=1;
    lblPageHeader.text=[[self.objDish.strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [[ProductOptionWebService service] callProductOptionWebServiceWithExtrasID:_objDish.arrExtras DishID:_objDish.strCategoryID CompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            [self displayErrorMessage:strMsg];
        }else{
            arrOuterOption=(NSMutableArray*)result;
            arrInnerOption=[(ModelProductOptionOuter*)[arrOuterOption firstObject] arrOption];
            [tblDisplay reloadData];
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (arrOuterOption.count==0) {
        return 0;
    }
    return arrInnerOption.count+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *vwHeader=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
    [vwHeader setBackgroundColor:[UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1.0F]];
    UILabel *lblHeader=[[UILabel alloc] initWithFrame:CGRectMake(8, 0, vwHeader.frame.size.width-8, vwHeader.frame.size.height)];
    lblHeader.textColor=[UIColor blackColor];
    [vwHeader addSubview:lblHeader];

    if (section==[self numberOfSectionsInTableView:tableView]-1) {
        lblHeader.text=@"Special Instruction";
    }else{
        ModelProductOptionInner *obj=arrInnerOption[section];
        lblHeader.text=obj.strName;
    }
    return vwHeader;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger sectionCount=0;
    if (section==[self numberOfSectionsInTableView:tableView]-1) {
        sectionCount=2;
    }else{
        sectionCount=[(ModelProductOptionInner*)arrInnerOption[section] arrChoices].count;
    }
    return sectionCount;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height=0.0f;
    if (indexPath.section==[self numberOfSectionsInTableView:tableView]-1) {
        if (indexPath.row==0) {
            height=80.0f;
        }
        else if (indexPath.row==1){
            height=45.0f;
        }
    }else{
        height=30.0f;
    }
    return height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell;
    if (indexPath.section==[self numberOfSectionsInTableView:tableView]-1) {
        if (indexPath.row==0) {
            static NSString *str=@"ProductSpecialInstructionTableViewCell";
            ProductSpecialInstructionTableViewCell *cell=(ProductSpecialInstructionTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[ProductSpecialInstructionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            myCell=cell;
        }
        else if (indexPath.row==1){
            static NSString *str=@"ProductAddTableViewCell";
            ProductAddTableViewCell *cell=(ProductAddTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[ProductAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            
            if (totalPrice==0.0f) {
                cell.lblTotalPrice.text=@"";
            }else{
                cell.lblTotalPrice.text=[NSString stringWithFormat:@"$ %0.2f",totalPrice];
            }
            
            if (orderCount>0) {
                cell.lblCount.text=[NSString stringWithFormat:@"%ld",(long)orderCount];
            }else{
                cell.lblCount.hidden=YES;
            }
            
            [cell.btnAdd addTarget:self action:@selector(btnAddPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btnMinus addTarget:self action:@selector(btnMinusPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btnPlus addTarget:self action:@selector(btnPlusPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            myCell=cell;
        }
    }else{
        ModelProductOptionInner *obj=arrInnerOption[indexPath.section];
        if ([[obj.strMaxSel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]>1) {
            static NSString *str=@"ProductCheckTableViewCell";
            ProductCheckTableViewCell *cell=(ProductCheckTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[ProductCheckTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            ModelChoice *objChoice=obj.arrChoices[indexPath.row];
            
            if (objChoice.isSelected) {
                cell.imgCheck.image=[UIImage imageNamed:@"checkbox_checked"];
            }else{
                cell.imgCheck.image=[UIImage imageNamed:@"checkbox"];
            }
            
            cell.lblContent.text=objChoice.strName;
            cell.lblPrice.text=[NSString stringWithFormat:@"$ %0.2f",[objChoice.strPrice floatValue]];
            
            myCell=cell;
        }else{
            static NSString *str=@"ProductRadioTableViewCell";
            ProductRadioTableViewCell *cell=(ProductRadioTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell=[[ProductRadioTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            }
            ModelChoice *objChoice=obj.arrChoices[indexPath.row];
            
            if (objChoice.isSelected) {
                cell.imgRadio.image=[UIImage imageNamed:@"radio_btn_checked"];
            }else{
                cell.imgRadio.image=[UIImage imageNamed:@"radio_btn"];
            }
            
            cell.lblContent.text=objChoice.strName;
            cell.lblPrice.text=[NSString stringWithFormat:@"$ %0.2f",[objChoice.strPrice floatValue]];
            
            myCell=cell;
        }
    }
    
    
    myCell.backgroundColor=myCell.contentView.backgroundColor=[UIColor clearColor];
    myCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return myCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelProductOptionInner *obj=arrInnerOption[indexPath.section];
    ModelChoice *objChoices=obj.arrChoices[indexPath.row];
    if ([[obj.strMaxSel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]>1) {
        if (objChoices.isSelected) {
            objChoices.selected=NO;
            obj.choiceCount--;
            totalPrice-=[[objChoices.strPrice stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] floatValue];
        }else{
            objChoices.selected=YES;
            obj.choiceCount++;
            totalPrice+=[[objChoices.strPrice stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] floatValue];
        }
        [obj.arrChoices removeObjectAtIndex:indexPath.row];
        [obj.arrChoices insertObject:objChoices atIndex:indexPath.row];
        
        [arrInnerOption removeObjectAtIndex:indexPath.section];
        [arrInnerOption insertObject:obj atIndex:indexPath.section];
    }else{
        if (!objChoices.isSelected) {
            for (int i=0; i<obj.arrChoices.count; i++) {
                ModelChoice *objTemp=obj.arrChoices[i];
                if ([[objTemp.strID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:[objChoices.strID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]) {
                    objTemp.selected=YES;
                    if (prevIndexPath) {
                        ModelProductOptionInner *prevObj=arrInnerOption[prevIndexPath.section];
                        ModelChoice *prevObjChoices=prevObj.arrChoices[prevIndexPath.row];
                        totalPrice-=[[prevObjChoices.strPrice stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] floatValue];
                    }
                    totalPrice+=[[objTemp.strPrice stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] floatValue];
                    prevIndexPath=indexPath;
                }else{
                    objTemp.selected=NO;
                }
                
                [obj.arrChoices removeObjectAtIndex:i];
                [obj.arrChoices insertObject:objTemp atIndex:i];
                
                [arrInnerOption removeObjectAtIndex:indexPath.section];
                [arrInnerOption insertObject:obj atIndex:indexPath.section];
            }
        }
    }
    
    [tblDisplay reloadData];
}

-(void)btnMinusPressed:(UIButton*)btn
{
    NSLog(@"%s",__func__);
    if (orderCount-1>0) {
        orderCount--;
        [tblDisplay reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:[self numberOfSectionsInTableView:tblDisplay]-1]] withRowAnimation:UITableViewRowAnimationNone];
        [tblDisplay scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:[self numberOfSectionsInTableView:tblDisplay]-1] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

-(void)btnPlusPressed:(UIButton*)btn
{
    NSLog(@"%s",__func__);
    orderCount++;
    [tblDisplay reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:[self numberOfSectionsInTableView:tblDisplay]-1]] withRowAnimation:UITableViewRowAnimationNone];
    [tblDisplay scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:[self numberOfSectionsInTableView:tblDisplay]-1] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

-(void)btnAddPressed:(UIButton*)btn
{
//    for (int i=0; i<arrInnerOption.count; i++) {
//        ModelProductOptionInner *obj=arrInnerOption[i];
//        if (obj.choiceCount>[[obj.strMaxSel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue] || obj.choiceCount<[[obj.strMinSel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]) {
//            [self displayErrorMessage:[NSString stringWithFormat:@"You can add minimum %ld and maximum %ld number of product",(long)[[obj.strMinSel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue],(long)[[obj.strMaxSel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue]]];
//            return;
//        }
//    }
    if (!self.appDel.arrSelectedDishes) {
        self.appDel.arrSelectedDishes=[NSMutableArray array];
    }
    [self.appDel.arrSelectedDishes addObject:[NSDictionary dictionaryWithObjects:@[[NSNumber numberWithFloat:totalPrice],[NSNumber numberWithInteger:orderCount],self.objDish] forKeys:@[@"totalPrice",@"orderCount",@"objDish"]]];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%s",__func__);
}


@end
