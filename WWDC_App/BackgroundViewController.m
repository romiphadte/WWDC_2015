//
//  BackgroundViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "BackgroundViewController.h"
#import <KLCPopup/KLCPopup.h>

@interface BackgroundViewController ()

@end

@implementation BackgroundViewController

-(instancetype)init{
    self=[super initWithNibName:@"BackgroundViewController" bundle:nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)delayAction{
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
    
    CGFloat pwidth=.70*width;
    CGFloat pheight=340;//.39*height;
    
    
    
    UIView *popUpView=[[UIView alloc] initWithFrame:CGRectMake((1-pwidth)/2, (1-pheight)/2, pwidth, pheight)];
    UIImageView *app_icon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background"]];
    app_icon.frame=CGRectMake(.50*pwidth-20,0.05*height, 40, 40);
    app_icon.layer.cornerRadius=6;
    app_icon.layer.masksToBounds=YES;
    [popUpView addSubview:app_icon];
    
    
    UITextView *textView=[[UITextView alloc] initWithFrame:CGRectMake(width*.02, height*.12, pwidth-.04*width,pheight-0.04*width)];
    
    textView.text=@"I am 20 years old and grew up in San Jose. My parents are both born in India, but I was born in the US. These fortunate circumstances give me dual citizenship. I visit India often and I am a proud Indian.  However, this love doesn't stop me from exploring the other cultures of the world through travel or food. I love sushi and I am addicted to Grilled Suyan chicken. But more than anything, I like to try something new.";
    textView.textAlignment=NSTextAlignmentCenter;
    textView.font=[UIFont fontWithName:@"Helvetica" size:15];
    textView.backgroundColor=[UIColor clearColor];
    
    [popUpView addSubview:textView];
    
    
    [popUpView setBackgroundColor:[UIColor whiteColor]];
    popUpView.layer.cornerRadius=4;
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:popUpView.bounds];
    popUpView.layer.masksToBounds = NO;
    popUpView.layer.shadowColor = [UIColor blackColor].CGColor;
    popUpView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    popUpView.layer.shadowOpacity = 0.5f;
    popUpView.layer.shadowPath = shadowPath.CGPath;
    
    
    KLCPopup* popup=[KLCPopup popupWithContentView:popUpView showType:KLCPopupShowTypeBounceInFromLeft dismissType:KLCPopupDismissTypeBounceOutToRight maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    popup.onDismiss=^void(){
        [self performSelector:@selector(closeApp) withObject:nil afterDelay:0.5];
    };
    
    [popup showWithLayout:KLCPopupLayoutCenter];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
