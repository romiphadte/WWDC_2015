//
//  AppScreenViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "HomePageViewController.h"
#import "UIButtonWithIndex.h"
#import "WWDC_App-Swift.h"
#import "RNPHomeScreenViewController.h"
#import <KLCPopup/KLCPopup.h>

@interface HomePageViewController ()

@property (nonatomic) HomeScreenModel* apps;

@end

@implementation HomePageViewController

- (instancetype) initWithPageNumber:(int)page{
    if(!self){
        self=[super init];
    }
    self.apps=[HomeScreenModel new];
    [self.apps setPage:page];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
   
    for (int i=0;i<4;i++){
        for (int j=0;j<6;j++){
            CGFloat x=i*width*.69/3+width*.07;
            CGFloat y=height*.05+j*height*.80/6;   //.033+j*height*.80/6
            
            NSString* appName=[self.apps appNameForIndex:i+4*j];
            UIButtonWithIndex *app=[[UIButtonWithIndex alloc] initWithFrame:CGRectMake(x,y, 62, 62)];
            [app setBackgroundImage:[UIImage imageNamed:appName] forState:UIControlStateNormal];
            if(appName.length!=0){
                [app addTarget:self action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
            }
            app.layer.cornerRadius=10;
            //app.backgroundColor=[UIColor whiteColor];
            app.layer.masksToBounds=YES;
            app.index=j*4+i;
            [self.view addSubview:app];
            
            UILabel *appLabel=[[UILabel alloc] initWithFrame:CGRectMake(x, y+62, 62, 20)];
            [appLabel setText:appName];
            [appLabel setFont:[UIFont fontWithName:@"Helvetica" size:11]];
            [appLabel setTextColor:[UIColor whiteColor]];
            [appLabel setTextAlignment:NSTextAlignmentCenter];
            [self.view addSubview:appLabel];
            
            
        }
    }
    
    
    
    
    
       // Do any additional setup after loading the view.
}



-(NSString*)appNameForIndex:(int)index{
    return [self.apps appNameForIndex:index];
}




-(void)enterApp:(id)sender{
    [(RNPHomeScreenViewController*)self.parentViewController loadApp:sender withName:[self appNameForIndex:((UIButtonWithIndex*) sender).index]];
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
