//
//  SignupViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 20/09/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "SignupViewController.h"
#import "SignUpTableViewCell.h"
#import "CountrySelectionViewController.h"
#import "CitySelectionViewController.h"
#import "ColonySelectionViewController.h"
#import "RegistrationWebService.h"

typedef NS_ENUM(NSUInteger, RowType) {
    FIRST_NAME,
    MIDDLE_NAME,
    LAST_NAME,
    EMAIL,
    PASSWORD,
    STREET,
    POSTAL_CODE,
    COUNTRY,
    CITY,
    COLONY,
    LAND_PHONE,
    MOBILE_PHONE,
    APT,
    TOTAL,
};

NSString static *strCellContent[]={
    [FIRST_NAME]=@"First name*",
    [MIDDLE_NAME]=@"Middle name",
    [LAST_NAME]=@"Last name*",
    [EMAIL]=@"E-mail*",
    [PASSWORD]=@"Password*",
    [STREET]=@"Street*",
    [POSTAL_CODE]=@"Post code*",
    [COUNTRY]=@"Choose country*",
    [CITY]=@"City*",
    [COLONY]=@"Colony*",
    [LAND_PHONE]=@"Land phone",
    [MOBILE_PHONE]=@"Mobile phone*",
    [APT]=@"APT/Suit*",
};


static NSString *strCellIdentifier=@"SignUpTableViewCell";

@interface SignupViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,CountrySelectionViewControllerDelegate,CitySelectionViewControllerDelegate,ColonySelectionViewControllerDelegate>
{
    IBOutlet UITableView *tblSignUp;
    IBOutlet UILabel *lblTop;
    
    NSMutableArray *arrValue;
    
    ModelCountry *objSelectedCountry;
    ModelCity *objSelectedCity;
    ModelColony *objSelectedColony;
}

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrValue=[NSMutableArray array];
    for (int i=0; i<TOTAL; i++) {
        [arrValue addObject:@""];
    }
    
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"Aleready have an Account? " attributes:nil];
    [attributedString1 appendAttributedString:[[NSAttributedString alloc] initWithString:@"Sign In" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:241.0f/255.0f green:81.0f/255.0f blue:83.0f/255.0f alpha:1.0f],NSFontAttributeName: [UIFont systemFontOfSize:lblTop.font.pointSize]}]];
    lblTop.attributedText = attributedString1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark TableView Delegate & DataSource
#pragma mark

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return TOTAL;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SignUpTableViewCell *cell=(SignUpTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"SignUpTableViewCell"];
    
    cell.lblHeader.text=strCellContent[indexPath.row];
    cell.txtContent.text=arrValue[indexPath.row];
    
    if (indexPath.row==COUNTRY || indexPath.row==CITY || indexPath.row==COLONY) {
        cell.btnDropDown.hidden=NO;
        cell.imgDropDown.hidden=NO;
    }else{
        cell.btnDropDown.hidden=YES;
        cell.imgDropDown.hidden=YES;
    }
    
    if (indexPath.row==EMAIL) {
        cell.txtContent.keyboardType=UIKeyboardTypeEmailAddress;
    }
    
    
    cell.txtContent.delegate=self;
    
    if (indexPath.row==[self tableView:tableView numberOfRowsInSection:indexPath.section]-1) {
        //Last Cell
        cell.txtContent.returnKeyType=UIReturnKeyDone;
    }else{
        //Except last cell
        cell.txtContent.returnKeyType=UIReturnKeyNext;
    }
    
    
    if (objSelectedCountry && indexPath.row==COUNTRY) {
        cell.txtContent.text=[objSelectedCountry.strName capitalizedString];
    }
    if (objSelectedCity && indexPath.row==CITY) {
        cell.txtContent.text=[objSelectedCity.strName capitalizedString];
    }
    if (objSelectedColony && indexPath.row==COLONY) {
        cell.txtContent.text=[objSelectedColony.strName capitalizedString];
    }
    
    switch (indexPath.row) {
        case COUNTRY:
            [cell.btnDropDown addTarget:self action:@selector(btnCountrySelectionPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case CITY:
            [cell.btnDropDown addTarget:self action:@selector(btnCitySelectionPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case COLONY:
            [cell.btnDropDown addTarget:self action:@selector(btnColonySelectionPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
            
            
        default:
            break;
    }
    
    cell.backgroundColor=cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark
#pragma mark UITextField Value Storage Method
#pragma mark

-(IBAction)textFieldValueChnaged:(UITextField*)textField
{
    SignUpTableViewCell *cell=[self getSuperViewOfType:[SignUpTableViewCell class] FromView:textField];
    NSIndexPath *indexPath=[tblSignUp indexPathForCell:cell];
    [arrValue removeObjectAtIndex:indexPath.row];
    [arrValue insertObject:textField.text atIndex:indexPath.row];
}

-(void)btnCountrySelectionPressed:(id)sender
{
    NSLog(@"%s",__func__);
    
    CountrySelectionViewController *master=[CountrySelectionViewController sharedInstance];
    master.view.frame=[[UIScreen mainScreen] bounds];
    [self.view addSubview:master.view];
    master.delegate=self;
}

-(void)btnCitySelectionPressed:(id)sender
{
    NSLog(@"%s",__func__);
    
    if (objSelectedCountry) {
        CitySelectionViewController *master=[CitySelectionViewController sharedInstance];
        master.delegate=self;
        master.view.frame=[[UIScreen mainScreen] bounds];
        [self.view addSubview:master.view];
    }else{
        [self displayErrorMessage:@"Please select the country first."];
    }
}

-(void)btnColonySelectionPressed:(id)sender
{
    NSLog(@"%s",__func__);
    
    if (objSelectedCountry && objSelectedCity) {
        ColonySelectionViewController *master=[ColonySelectionViewController sharedInstance];
        master.delegate=self;
        master.view.frame=[[UIScreen mainScreen] bounds];
        [self.view addSubview:master.view];
    }else{
        [self displayErrorMessage:@"Please select the Country and the City first."];
    }
}

#pragma mark
#pragma mark UITextField Delegate
#pragma mark

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    SignUpTableViewCell *cell=[self getSuperViewOfType:[SignUpTableViewCell class] FromView:textField];
    [tblSignUp setContentOffset:CGPointMake(cell.frame.origin.x, cell.frame.origin.y) animated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    SignUpTableViewCell *cell=[self getSuperViewOfType:[SignUpTableViewCell class] FromView:textField];
    NSIndexPath *indexPath=[tblSignUp indexPathForCell:cell];
    if (indexPath.row==[self tableView:tblSignUp numberOfRowsInSection:indexPath.section]-1) {
        //Last Cell
        [tblSignUp setContentOffset:CGPointMake(0, 0) animated:YES];
    }else{
        //Except last cell
        NSIndexPath *indexPathNext=[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        SignUpTableViewCell *cellNext=[tblSignUp cellForRowAtIndexPath:indexPathNext];
        [cellNext.txtContent becomeFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark
#pragma mark Validation Checking
#pragma mark

-(BOOL)isAllEntryIsCorrect
{
    BOOL flag=YES;
    NSString *strErrorMsg=@"";
    
    if ([[arrValue objectAtIndex:FIRST_NAME] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your first name";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:LAST_NAME] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your last name";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:EMAIL] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your email id";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:PASSWORD] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your password";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:STREET] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your street";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:POSTAL_CODE] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your post code";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:COUNTRY] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your country";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:CITY] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your city";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:COLONY] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your colony";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:MOBILE_PHONE] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your mobile phone number";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:LAST_NAME] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your last name";
        flag=NO;
    }
    else if ([[arrValue objectAtIndex:APT] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        strErrorMsg=@"Please enter your APT//Suit";
        flag=NO;
    }
    
    if (!flag) {
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:strErrorMsg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOK=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
        [alertController addAction:actionOK];
        [self presentViewController:alertController animated:YES completion:^{
            
        }];
    }
    
    return flag;
}

#pragma mark
#pragma mark IBAction
#pragma mark


-(IBAction)btnCheckoutPresed:(id)sender
{
    if ([self isAllEntryIsCorrect]) {
        
        if ([self isNetworkRechable]) {
            [self displayActivityWithMessage:@"Please Wait..."];
            [[RegistrationWebService service] callRegistrationServiceForName:arrValue[FIRST_NAME] LastName:arrValue[LAST_NAME] LastName2:@"" Email:arrValue[EMAIL] Password:arrValue[PASSWORD] Address:arrValue[STREET] Colony:arrValue[COLONY] ZIP:arrValue[POSTAL_CODE] Country:arrValue[COUNTRY] City:arrValue[CITY] Telephone:arrValue[LAND_PHONE] CellPhone:arrValue[MOBILE_PHONE] API:@"" WithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
                [self dismissActivity];
                if (isError) {
                    [self displayErrorMessage:strMsg];
                }else{
                    
                }
            }];
        }else{
            [self displayErrorMessage:@"Network is not rechable, please try agaian leter..."];
        }
    }
}
#pragma mark
#pragma mark Country Selection Delegate
#pragma mark


-(void)didSelectedCountry:(ModelCountry *)selectedCountry
{
    NSLog(@"%@",selectedCountry.strID);
    NSLog(@"%@",selectedCountry.strName);
    objSelectedCountry=selectedCountry;
    [tblSignUp reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:COUNTRY inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    CountrySelectionViewController *master=[CountrySelectionViewController sharedInstance];
    [master.view removeFromSuperview];
}

#pragma mark
#pragma mark City Selection Delegate
#pragma mark

-(void)didSelectedCity:(ModelCity *)selectedCity Controller:(CitySelectionViewController *)controller
{
    objSelectedCity=selectedCity;
     [tblSignUp reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:CITY inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [controller.view removeFromSuperview];
}

-(NSString*)selectedCountryID:(CitySelectionViewController *)controller
{
    if (objSelectedCountry) {
        return objSelectedCountry.strID;
    }
    return nil;
}

#pragma mark
#pragma mark Colony Selection Delegate
#pragma mark

-(void)didSelectedColony:(ModelColony *)selectedColony Controller:(ColonySelectionViewController *)controller
{
    objSelectedColony=selectedColony;
    [tblSignUp reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:COLONY inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [controller.view removeFromSuperview];
}

-(NSString*)selectedCityID:(ColonySelectionViewController *)controller
{
    if (objSelectedCity) {
        return objSelectedCity.strID;
    }
    return nil;
}


@end
