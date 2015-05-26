//
//  Machine LearningViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "Machine LearningViewController.h"
#import <KLCPopup/KLCPopup.h>

@interface Machine_LearningViewController ()

@end

@implementation Machine_LearningViewController

-(instancetype)init{
    self=[super initWithNibName:@"Machine LearningViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"machineLearningBackground"]];
    // Do any additional setup after loading the view from its nib.
}

-(void)delayAction{
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
    
    CGFloat pwidth=.70*width;
    CGFloat pheight=500;//.62*height;
    
    
    
    UIView *popUpView=[[UIView alloc] initWithFrame:CGRectMake((1-pwidth)/2, (1-pheight)/2, pwidth, pheight)];
    UIImageView *app_icon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Machine_Learning"]];
    app_icon.frame=CGRectMake(.50*pwidth-20,0.05*height, 40, 40);
    [popUpView addSubview:app_icon];
    
    
    
    UITextView *textView=[[UITextView alloc] initWithFrame:CGRectMake(width*.02, height*.12, pwidth-.04*width,pheight-0.04*width)];
    
    textView.text=@"I like to work beyond building traditional UIs on iPhone apps; I also love working on really hard programminng problems. The poor resolution, handwritten digits in the background is the MINST data set. Through my classes, I built neural nets and decision trees from scratch that could recognize handwritten digits with 98.5% accuracy. My implementation is in python and I am in the process of porting this over to Swift and Objective C. Beyond my work in machine learning, I am also working on research in classical AI. With a partnership with SF General Hospital, I am using particle filters to detect anomalies in blood pressure and ICP. (Intercranial Pressure). I am currently looking into incorporating this research into watchkit and research kit.";
    
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
    
    
    KLCPopup* popup=[KLCPopup popupWithContentView:popUpView showType:KLCPopupShowTypeFadeIn dismissType:KLCPopupDismissTypeFadeOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    popup.onDismiss=^void(){
        [self performSelector:@selector(closeApp) withObject:nil afterDelay:0.5];
    };
    
    [popup showWithLayout:KLCPopupLayoutCenter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
