//
//  RoboticsViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "RoboticsViewController.h"
#import <youtube-ios-player-helper/YTPlayerView.h>
#import <KLCPopup/KLCPopup.h>

@interface RoboticsViewController ()
//@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

@end

@implementation RoboticsViewController

-(instancetype)init{
    self=[super initWithNibName:@"RoboticsViewController" bundle:nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.playerView loadVideoByURL:@"https://www.youtube.com/watch?v=ryx57mG1mrU" startSeconds:0 suggestedQuality:kYTPlaybackQualityMedium];
    
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
    
    UIButton *closeButton= [[UIButton alloc] init];
    [closeButton setFrame:CGRectMake(0, height*0.92, width, height*0.08)];
    [closeButton setBackgroundColor:[UIColor lightGrayColor]];
    [closeButton setTitle:@"Sweet!" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeApp) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:closeButton];
    // Do any additional setup after loading the view from its nib.
}

-(void)delayAction{
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
    
    CGFloat pwidth=.70*width;
    CGFloat pheight=420;//.56*height;
    
    
    
    UIView *popUpView=[[UIView alloc] initWithFrame:CGRectMake((1-pwidth)/2, (1-pheight)/2, pwidth, pheight)];
    UIImageView *app_icon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Robotics"]];
    app_icon.frame=CGRectMake(.50*pwidth-20,0.05*height, 40, 40);
    [popUpView addSubview:app_icon];
    
    
    
    UITextView *textView=[[UITextView alloc] initWithFrame:CGRectMake(width*.02, height*.12, pwidth-.04*width,pheight-0.04*width)];
    
    textView.text=@"I taught myself how to code when I was 14 by reading a C++ book. With this knowledge I started building robots and started a club at my school. We were terrible, placing last place. Fortunately, we got better each year. By my senior year, we made it to quarter finals beating many experienced teams. I used this knowledge of robotics to automate my room and actuate it via iPod Touch. I was featured on ABC7 for this and my academic accomplishments. I haven't stopped with my room. To this day, I think of ways to automate more things in my life.";
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
    
    
    KLCPopup* popup=[KLCPopup popupWithContentView:popUpView showType:KLCPopupShowTypeBounceInFromTop dismissType:KLCPopupDismissTypeBounceOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    popup.onDismiss=^void(){
        [self performSelector:@selector(closeApp) withObject:nil afterDelay:0.5];
    };
    
    [popup showWithLayout:KLCPopupLayoutCenter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)play:(id)sender {
//    [self.playerView playVideo];
//   }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
