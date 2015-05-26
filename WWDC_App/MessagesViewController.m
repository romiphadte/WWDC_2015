//
//  MessagesViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "MessagesViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)delayAction{
    MFMessageComposeViewController *messageVC = [[MFMessageComposeViewController alloc] init];
    
    messageVC.body = @"Hello Romi! We are currently reviewing your WWDC application";
    messageVC.recipients = @[@"4086428972"];
    messageVC.messageComposeDelegate = self;
    if([MFMessageComposeViewController canSendText]){
        [self presentViewController:messageVC animated:NO completion:NULL];
    }
    else{
        [self performSelector:@selector(closeApp) withObject:self afterDelay:2];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Message was cancelled");
            [self dismissViewControllerAnimated:YES completion:NULL];             break;
        case MessageComposeResultFailed:
            NSLog(@"Message failed");
            [self dismissViewControllerAnimated:YES completion:NULL];             break;
        case MessageComposeResultSent:
            NSLog(@"Message was sent");
            [self dismissViewControllerAnimated:YES completion:NULL];             break;
        default:             
            break;     
    }
    [self performSelector:@selector(closeApp) withObject:self afterDelay:1];
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
