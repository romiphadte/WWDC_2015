//
//  AppViewController.h
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButtonWithIndex.h"
#import "RNPHomeScreenViewController.h"

@interface AppViewController : UIViewController

@property (nonatomic,weak) UIButtonWithIndex* appButton;
@property (nonatomic,weak) RNPHomeScreenViewController* home;

-(void)closeApp;

@end
