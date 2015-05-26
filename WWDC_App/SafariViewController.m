//
//  SafariViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "SafariViewController.h"

@interface SafariViewController ()

@end

@implementation SafariViewController

-(instancetype)init{
    self=[super initWithNibName:@"SafariViewController" bundle:nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://abclocal.go.com/story?section=news/education&id=8693415"]]];
    // Do any additional setup after loading the view from its nib.
    
    _webView.scalesPageToFit=YES;
}
- (IBAction)tapped:(id)sender {
    [self closeApp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)delayAction{
    //[[[UIAlertView alloc]initWithTitle:@"No Cellular Connection" message:@"App will quit" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self closeApp];
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
