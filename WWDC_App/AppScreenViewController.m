//
//  AppScreenViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "AppScreenViewController.h"

@interface AppScreenViewController ()

@end

@implementation AppScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *messages=[[UIButton alloc] initWithFrame:CGRectMake(30, 40, 60, 60)];
    [messages setBackgroundImage:[UIImage imageNamed:@"messages"] forState:UIControlStateNormal];
    
    [self.view addSubview:messages];
    
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
