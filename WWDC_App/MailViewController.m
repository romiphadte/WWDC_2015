//
//  MailViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "MailViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface MailViewController ()

@end

@implementation MailViewController

-(instancetype)init{
    self=[super initWithNibName:@"MailViewController" bundle:nil];
    
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



- (void)delayAction{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
  
    [picker setSubject:@"WWDC 2015"];
    
    // Set up the recipients.
    NSArray *toRecipients = [NSArray arrayWithObjects:@"romiphadte@gmail.com",
                             nil];
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"romiphadte@berkeley.edu",
                             nil];
    
    [picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];
    
    NSString *emailBody = @"We are currently reviewing your application Romi!";
    [picker setMessageBody:emailBody isHTML:NO];
    
    // Present the mail composition interface.
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    //[self presentModalViewController:picker animated:YES];
}

// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    //[self dismissModalViewControllerAnimated:YES];
    [self performSelector:@selector(closeApp) withObject:self afterDelay:1];
}
    
    
//    
//    
//    
//    MFMailComposeViewController
//    [[[UIAlertView alloc]initWithTitle:@"Email Not Set Up" message:@"App will quit" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
//}
//



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
