//
//  YoutubeViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/29/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "YoutubeViewController.h"

@interface YoutubeViewController ()

@property (strong,nonatomic) UIWebView *ytview;

@end

@implementation YoutubeViewController


- (void)playVideoWithId:(NSString *)videoId {
    [self.ytview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=2aFIJZuqlrg"]]];
    
    //[self.ytview loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    CGRect screenSize=[UIScreen mainScreen].bounds;
    
    self.ytview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenSize.size.width,screenSize.size.height*0.93)];
    UIButton*back=[[UIButton alloc]initWithFrame:CGRectMake(0,screenSize.size.height*0.93, screenSize.size.width, screenSize.size.height*.07)];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(closeApp) forControlEvents:UIControlEventTouchUpInside];
    [back setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:self.ytview];
    [self.view addSubview:back];
    [self playVideoWithId:@"2aFIJZuqlrg"];
    // Do any additional setup after loading the view.
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
