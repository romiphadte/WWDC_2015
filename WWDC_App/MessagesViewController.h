//
//  MessagesViewController.h
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "AppViewController.h"
#import <MessageUI/MessageUI.h>

@interface MessagesViewController : AppViewController<UIAlertViewDelegate,MFMessageComposeViewControllerDelegate>

@end
