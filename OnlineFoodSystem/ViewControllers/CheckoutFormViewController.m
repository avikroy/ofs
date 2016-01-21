//
//  GuestCheckoutFormViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 07/01/16.
//  Copyright © 2016 Kaustav Shee. All rights reserved.
//

#import "CheckoutFormViewController.h"
#import "GuestCheckoutWebService.h"
#import "GuestCheckoutTableViewCell.h"
#import "ModelGuestCheckout.h"

@interface CheckoutFormViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    @private
    IBOutlet UITableView *tblDisplay;
    
    NSMutableArray *arrDisplay;
}

@end

@implementation CheckoutFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tblDisplay.hidden=YES;
    
    [[GuestCheckoutWebService service] callGuestCheckoutWebServiceWithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            [self displayErrorMessage:strMsg];
        }else{
            if ([result isKindOfClass:[NSMutableArray class]]) {
                arrDisplay=(NSMutableArray*)result;
                if (arrDisplay.count>0) {
                    for (int i=0; i<arrDisplay.count; i++) {
                        ModelGuestCheckout *obj=arrDisplay[i];
                        if ([[[obj.strFieldName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:@"Name"]) {
                            if (self.strName && [self.strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
                                obj.strFieldValue=[self.strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                            }else{
                                obj.strFieldValue=@"";
                            }
                        }
                        if ([[[obj.strFieldName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:@"Email"]) {
                            if (self.strEmail && [self.strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
                                obj.strFieldValue=[self.strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                            }else{
                                obj.strFieldValue=@"";
                            }
                        }
                        
                        [arrDisplay removeObjectAtIndex:i];
                        [arrDisplay insertObject:obj atIndex:i];
                    }
                    [tblDisplay reloadData];
                    tblDisplay.hidden=NO;
                }
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrDisplay.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"GuestCheckoutTableViewCell";
    
    GuestCheckoutTableViewCell *cell=(GuestCheckoutTableViewCell*)[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[GuestCheckoutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    ModelGuestCheckout *obj=arrDisplay[indexPath.row];
    if (obj.isRequired) {
        cell.lblContent.text=[NSString stringWithFormat:@"%@ *",[[obj.strFieldName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString]];
    }else{
        cell.lblContent.text=[[obj.strFieldName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString];
    }
    
    if (obj.strFieldValue && [obj.strFieldValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length>0) {
        cell.txtContent.text=[obj.strFieldValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }else{
        cell.txtContent.text=@"";
    }
    
    cell.txtContent.tag=indexPath.row;
    cell.txtContent.delegate=self;
    [cell.txtContent addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)textFieldValueChanged:(UITextField*)textField
{
    ModelGuestCheckout *obj=arrDisplay[textField.tag];
    obj.strFieldValue=[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [arrDisplay removeObjectAtIndex:textField.tag];
    [arrDisplay insertObject:obj atIndex:textField.tag];
    [tblDisplay reloadData];
}

-(BOOL)alertChecking
{
    for (ModelGuestCheckout *obj in arrDisplay) {
        if (obj.isRequired && [obj.strFieldValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
            [self displayErrorMessage:[NSString stringWithFormat:@"Please enter %@",obj.strFieldName]];
            return NO;
        }
    }
    return YES;
}

-(IBAction)btnProceedCheckoutPressed:(id)sender
{
    if ([self alertChecking]) {
        
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType=UIReturnKeyDone;
    [tblDisplay scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:textField.tag inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
