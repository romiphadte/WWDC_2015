//
//  PhoneViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "PhoneViewController.h"

@interface PhoneViewController ()

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * background=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phoneScreen"]];
    background.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:background];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(showAlert) withObject:nil afterDelay:1.0];
}

- (void)showAlert{
    [[[UIAlertView alloc]initWithTitle:@"No Cellular Connection" message:@"App will quit" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self closeApp];
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
