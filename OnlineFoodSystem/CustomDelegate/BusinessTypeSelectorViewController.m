//
//  OrderTypeSelectorViewController.m
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 03/10/15.
//  Copyright © 2015 Kaustav Shee. All rights reserved.
//

#import "BusinessTypeSelectorViewController.h"
#import "AppDelegate.h"

@interface BusinessTypeSelectorViewController ()<UIGestureRecognizerDelegate>
{
    @private
    IBOutlet UIImageView *imgLeft;
    IBOutlet UIImageView *imgMiddle;
    IBOutlet UIImageView *imgRight;
    IBOutlet UIImageView *imgTrack;
    IBOutlet UIImageView *imgChannel;
    
    IBOutlet UILabel *lblLeft;
    IBOutlet UILabel *lblRight;
    IBOutlet UILabel *lblMiddle;
    
    
    BOOL isContainPoint;
    
    AppDelegate *appDel;
}

@end

@implementation BusinessTypeSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    imgLeft.userInteractionEnabled = YES;
    imgMiddle.userInteractionEnabled=YES;
    imgRight.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *leftTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(leftGesture:)];
    leftTapGesture.numberOfTapsRequired = 1;
    [leftTapGesture setDelegate:self];
    [imgLeft addGestureRecognizer:leftTapGesture];
    
    UITapGestureRecognizer *middleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(middleGesture:)];
    middleTapGesture.numberOfTapsRequired = 1;
    [middleTapGesture setDelegate:self];
    [imgMiddle addGestureRecognizer:middleTapGesture];
    
    UITapGestureRecognizer *rightTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(rightGesture:)];
    rightTapGesture.numberOfTapsRequired = 1;
    [rightTapGesture setDelegate:self];
    [imgRight addGestureRecognizer:rightTapGesture];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    imgLeft.layer.cornerRadius=imgLeft.frame.size.width/2.0f;
    imgMiddle.layer.cornerRadius=imgMiddle.frame.size.width/2.0f;
    imgRight.layer.cornerRadius=imgRight.frame.size.width/2.0f;
    
    if (appDel.arrBusinessType.count==1) {
        imgLeft.hidden=imgRight.hidden=YES;
        lblLeft.hidden=lblRight.hidden=YES;
        imgChannel.hidden=YES;
        imgTrack.center=imgMiddle.center;
        lblMiddle.text=[[appDel.arrBusinessType objectAtIndex:0] capitalizedString];
    }
    else if (appDel.arrBusinessType.count==2){
        imgMiddle.hidden=YES;
        lblMiddle.hidden=YES;
        lblLeft.text=[[appDel.arrBusinessType firstObject] capitalizedString];
        lblRight.text=[[appDel.arrBusinessType lastObject] capitalizedString];
    }
    else if (appDel.arrBusinessType.count==3){
        lblLeft.text=[[appDel.arrBusinessType firstObject] capitalizedString];
        lblRight.text=[[appDel.arrBusinessType lastObject] capitalizedString];
        lblMiddle.text=[[appDel.arrBusinessType objectAtIndex:1] capitalizedString];
    }
    else{
        imgLeft.hidden=imgMiddle.hidden=imgRight.hidden=imgTrack.hidden=YES;
    }
    self.business_type=[[[appDel.arrBusinessType firstObject] capitalizedString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBusiness:(NSString*)strBusinessType
{
    appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    if (appDel.arrBusinessType.count==1) {
        imgLeft.hidden=imgRight.hidden=YES;
        lblLeft.hidden=lblRight.hidden=YES;
        imgChannel.hidden=YES;
        imgTrack.center=imgMiddle.center;
        lblMiddle.text=[[appDel.arrBusinessType objectAtIndex:0] capitalizedString];
        
        self.business_type=[[[appDel.arrBusinessType firstObject] capitalizedString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [self moveToMiddle];
    }
    else if (appDel.arrBusinessType.count==2){
        imgMiddle.hidden=YES;
        lblMiddle.hidden=YES;
        lblLeft.text=[[appDel.arrBusinessType firstObject] capitalizedString];
        lblRight.text=[[appDel.arrBusinessType lastObject] capitalizedString];
        
        if ([[[strBusinessType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:lblLeft.text]) {
            self.business_type=lblLeft.text;
            [self moveToLeft];
        }
        else if ([[[strBusinessType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:lblRight.text]){
            self.business_type=lblRight.text;
            [self moveToRight];
        }
    }
    else if (appDel.arrBusinessType.count==3){
        lblLeft.text=[[appDel.arrBusinessType firstObject] capitalizedString];
        lblRight.text=[[appDel.arrBusinessType lastObject] capitalizedString];
        lblMiddle.text=[[appDel.arrBusinessType objectAtIndex:1] capitalizedString];
        
        if ([[[strBusinessType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:lblLeft.text]) {
            self.business_type=lblLeft.text;
            [self moveToLeft];
        }
        else if ([[[strBusinessType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:lblMiddle.text]){
            self.business_type=lblMiddle.text;
            [self moveToMiddle];
        }
        else if ([[[strBusinessType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] capitalizedString] isEqualToString:lblRight.text]){
            self.business_type=lblRight.text;
            [self moveToRight];
        }
    }
    else{
        imgLeft.hidden=imgMiddle.hidden=imgRight.hidden=imgTrack.hidden=YES;
        self.business_type=@"";
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

+(BusinessTypeSelectorViewController*)sharedInstance
{
    static BusinessTypeSelectorViewController *orderTypeSelectorController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        orderTypeSelectorController=[[BusinessTypeSelectorViewController alloc] initWithNibName:@"BusinessTypeSelectorViewController" bundle:nil];
    });
    return orderTypeSelectorController;
}

- (void)leftGesture: (UITapGestureRecognizer*)gesture
{
    [self moveToLeft];
}

-(void)moveToLeft
{
    @synchronized(self) {
        [UIView animateWithDuration:0.5 animations:^{
            imgTrack.center=imgLeft.center;
        } completion:^(BOOL finished) {
            NSLog(@"imgLeft    = %@",NSStringFromCGRect(imgLeft.frame));
            NSLog(@"imgRight   = %@",NSStringFromCGRect(imgRight.frame));
            NSLog(@"imgMiddle  = %@",NSStringFromCGRect(imgMiddle.frame));
            self.business_type=[lblLeft.text capitalizedString];
            if (self.delegate && [self.delegate respondsToSelector:@selector(didSelected:Controller:)]) {
                [self.delegate didSelected:[appDel.arrBusinessType indexOfObject:[lblLeft.text capitalizedString]] Controller:self];
            }
        }];
    }
}

-(void)middleGesture:(UITapGestureRecognizer*)gesture
{
    [self moveToMiddle];
}

-(void)moveToMiddle
{
    @synchronized(self) {
        [UIView animateWithDuration:0.5 animations:^{
            imgTrack.center=imgMiddle.center;
        } completion:^(BOOL finished) {
            NSLog(@"imgLeft    = %@",NSStringFromCGRect(imgLeft.frame));
            NSLog(@"imgRight   = %@",NSStringFromCGRect(imgRight.frame));
            NSLog(@"imgMiddle  = %@",NSStringFromCGRect(imgMiddle.frame));
            self.business_type=[lblMiddle.text capitalizedString];
            if (self.delegate && [self.delegate respondsToSelector:@selector(didSelected:Controller:)]) {
                [self.delegate didSelected:[appDel.arrBusinessType indexOfObject:[lblMiddle.text capitalizedString]] Controller:self];
            }
        }];
    }
}

-(void)rightGesture:(UITapGestureRecognizer*)gesture
{
    [self moveToRight];
}

-(void)moveToRight
{
    @synchronized(self) {
        [UIView animateWithDuration:0.5 animations:^{
            imgTrack.center=imgRight.center;
        } completion:^(BOOL finished) {
            NSLog(@"imgLeft    = %@",NSStringFromCGRect(imgLeft.frame));
            NSLog(@"imgRight   = %@",NSStringFromCGRect(imgRight.frame));
            NSLog(@"imgMiddle  = %@",NSStringFromCGRect(imgMiddle.frame));
            self.business_type=[lblRight.text capitalizedString];
            if (self.delegate && [self.delegate respondsToSelector:@selector(didSelected:Controller:)]) {
                [self.delegate didSelected:[appDel.arrBusinessType indexOfObject:[lblRight.text capitalizedString]] Controller:self];
            }
        }];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    NSLog(@"start = %@",NSStringFromCGPoint(location));
    
    if (CGRectContainsPoint(imgTrack.frame, location)) {
        NSLog(@"Contains point");
        isContainPoint=YES;
    }else{
        isContainPoint=NO;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    NSLog(@"move = %@",NSStringFromCGPoint(location));
    if (isContainPoint) {
        if (location.x>=imgLeft.center.x && location.x<=imgRight.center.x) {
            imgTrack.center=CGPointMake(location.x, imgTrack.center.y);
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    NSLog(@"end = %@",NSStringFromCGPoint(location));
    
    CGFloat distanceLeft = sqrt(pow(imgLeft.center.x-imgTrack.center.x, 2) + 0);
    CGFloat distanceMiddle = sqrt(pow(imgMiddle.center.x-imgTrack.center.x, 2) + 0);
    CGFloat distanceRight = sqrt(pow(imgRight.center.x-imgTrack.center.x, 2) + 0);
    
    
    if (appDel.arrBusinessType.count==1) {
        
    }
    else if (appDel.arrBusinessType.count==2){
        if (distanceLeft<distanceRight) {
            [self moveToLeft];
        }else{
            [self moveToRight];
        }
    }
    else if (appDel.arrBusinessType.count==3){
        if (distanceLeft<distanceMiddle && distanceLeft<distanceRight) {
            [self moveToLeft];
        }
        else if (distanceMiddle<distanceLeft && distanceMiddle<distanceRight){
            [self moveToMiddle];
        }
        else if (distanceRight<distanceLeft && distanceRight<distanceMiddle){
            [self moveToRight];
        }
    }
    else{
        
    }
}

@end
