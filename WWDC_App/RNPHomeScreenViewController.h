//
//  RNPHomeScreenViewController.h
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNPHomeScreenViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

-(void)loadApp:(id)sender withName:(NSString*) name;
-(void)closeApp:(id)sender;
-(void)closeDockApp:(id)sender;

@end
