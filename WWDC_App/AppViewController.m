//
//  AppViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "AppViewController.h"
#import "RNPHomeScreenViewController.h"
#import "WWDC_APp-Swift.h"

@implementation AppViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    
    
    [self performSelector:@selector(delayAction) withObject:nil afterDelay:1.0];
}

- (void)delayAction{
}


- (void)closeApp{
    if(self.appButton.index<0){
        [self.home closeDockApp:self.appButton];
    }
    
    else{
        [self.home closeApp:self.appButton];
    }
}
@end
