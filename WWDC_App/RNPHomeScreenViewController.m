//
//  RNPHomeScreenViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "RNPHomeScreenViewController.h"
#import "HomePageViewController.h"
#import "UIButtonWithIndex.h"
#import "RNPApps.h"
#import "AppViewController.h"
#import <FXBlurView/FXBlurView.h>
#import "WWDC_App-Swift.h"
#import <ACParallaxView.h>
#import <KLCPopup/KLCPopup.h>

@interface RNPHomeScreenViewController ()

@property (nonatomic,strong) UIView* firstPage;
@property (assign) BOOL pageControlUsed;
@property (assign) NSUInteger page;
@property (assign) BOOL rotating;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic,strong) AppViewController * appViewController;
@property (nonatomic,strong) HomeScreenModel *apps;
@property (nonatomic,strong) FXBlurView* dock;

- (void)loadScrollViewWithPage:(int)page;

@end

@implementation RNPHomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.apps=[HomeScreenModel new];
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
   
    UIImage* backgroundImage=[UIImage imageNamed:@"milkyway"];
    UIImageView* background=[[UIImageView alloc] initWithImage:backgroundImage];
    background.frame=CGRectMake(0, 0, width, height);
    ACParallaxView *pview=[[ACParallaxView alloc] initWithFrame:CGRectMake(0,0,width,height)];
    [pview addSubview:background];
    pview.parallax=TRUE;
    [self.view addSubview:pview];
    
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    [self.view addSubview:self.scrollView];
    
    
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.scrollView setDelegate:self];
   
//    _firstPage=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
//    [self.view addSubview:_firstPage];
//
    
    HomePageViewController* one=[[HomePageViewController alloc]initWithPageNumber:0];
    HomePageViewController* two=[[HomePageViewController alloc]initWithPageNumber:1];
    
    [self addChildViewController:one];
    [self addChildViewController:two];
    
    self.dock=[[FXBlurView alloc] initWithFrame:CGRectMake(0, height*.85, width, height*.15)];
    self.dock.tintColor=[UIColor whiteColor];
    //dock.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:self.dock];
    
   
    for(int i=0;i<4;i++){
        
        CGFloat x=i*width*.69/3+width*.07;
        CGFloat y=.15*height*.15;   //.033+j*height*.80/6
        
        NSString* appName=[self.apps dockAppNameForIndex:i];
        UIButtonWithIndex *app=[[UIButtonWithIndex alloc] initWithFrame:CGRectMake(x,y, 62, 62)];
        [app setBackgroundImage:[UIImage imageNamed:appName] forState:UIControlStateNormal];
        if(appName.length!=0){
            [app addTarget:self action:@selector(loadDockApp:) forControlEvents:UIControlEventTouchUpInside];
        }
        app.layer.cornerRadius=10;
        //app.backgroundColor=[UIColor whiteColor];
        app.layer.masksToBounds=YES;
        app.index=-i-1;
        [self.dock addSubview:app];
        
        UILabel *appLabel=[[UILabel alloc] initWithFrame:CGRectMake(x, y+62, 62, 20)];
        [appLabel setText:appName];
        [appLabel setFont:[UIFont fontWithName:@"Helvetica" size:11]];
        [appLabel setTextColor:[UIColor whiteColor]];
        [appLabel setTextAlignment:NSTextAlignmentCenter];
        [self.dock addSubview:appLabel];
    }
    

    
//
//    UIButton *messages=[[UIButton alloc] initWithFrame:CGRectMake(30, 40, 60, 60)];
//    [messages setBackgroundImage:[UIImage imageNamed:@"messages"] forState:UIControlStateNormal];
//    [self.firstPage addSubview:messages];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (int i =0; i < [self.childViewControllers count]; i++) {
        [self loadScrollViewWithPage:i];
    }
    
    self.pageControl.currentPage = 0;
    _page = 0;
    [self.pageControl setNumberOfPages:[self.childViewControllers count]];
    
    UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
    if (viewController.view.superview != nil) {
        [viewController viewWillAppear:animated];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * [self.childViewControllers count], self.scrollView.frame.size.height);
    
    
    [self performSelector:@selector(performPopup) withObject:self afterDelay:1.0];
}



- (void)loadScrollViewWithPage:(int)page {
    if (page < 0)
        return;
    if (page >= [self.childViewControllers count])
        return;
    
    // replace the placeholder if necessary
    UIViewController *controller = [self.childViewControllers objectAtIndex:page];
    if (controller == nil) {
        return;
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil) {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.scrollView addSubview:controller.view];
    }
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControlUsed = NO;
}


-(void)performPopup{
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
    
    CGFloat pwidth=.70*width;
    CGFloat pheight=140;//.16*height;
    
    
    
    UIView *popUpView=[[UIView alloc] initWithFrame:CGRectMake((1-pwidth)/2, (1-pheight)/2, pwidth, pheight)];
    
    UITextView *textView=[[UITextView alloc] initWithFrame:CGRectMake(width*.02, height*.02, pwidth-.04*width,pheight-0.04*width)];
    
    textView.text=@"Welcome to your new iPhone. Tap on the dimmed areas to dismiss popups. Swipe through screens and run the apps to learn more about Romi.  P.S. Check the parallax";
    textView.textAlignment=NSTextAlignmentCenter;
    textView.font=[UIFont fontWithName:@"Helvetica" size:15];
    textView.backgroundColor=[UIColor clearColor];
    
    
    [popUpView addSubview:textView];
    
    
    [popUpView setBackgroundColor:[UIColor whiteColor]];
    popUpView.layer.cornerRadius=4;
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:popUpView.bounds];
    popUpView.layer.masksToBounds = NO;
    popUpView.layer.shadowColor = [UIColor blackColor].CGColor;
    popUpView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    popUpView.layer.shadowOpacity = 0.5f;
    popUpView.layer.shadowPath = shadowPath.CGPath;
    
    
    KLCPopup* popup=[KLCPopup popupWithContentView:popUpView showType:KLCPopupShowTypeFadeIn dismissType:KLCPopupDismissTypeFadeOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    popup.onDismiss=^void(){
        NSLog(@"dismissing");
    };
    
    [popup showWithLayout:KLCPopupLayoutCenter];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadApp:(id) sender withName:(NSString*) name{
    [self loadAppAnimation:sender :self.view withName:name];
}
- (void)loadDockApp:(id) sender{
    [self loadAppAnimation:sender :self.dock withName:nil];
}

-(void)loadAppAnimation:(id)sender :(UIView*)enclosingView withName:(NSString*) name{
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;


    UIButtonWithIndex *button=(UIButtonWithIndex*)sender;
    NSLog(@"id is %d",((UIButtonWithIndex*)sender).index);
    Class class=nil;
    if(name){
        class=NSClassFromString([name stringByAppendingString:@"ViewController"]);
    }
    else{
        if(enclosingView==self.view){
            class=NSClassFromString([[self.childViewControllers[self.page] appNameForIndex:button.index] stringByAppendingString:@"ViewController"]);
        }
        else{
            class=NSClassFromString([[self.apps dockAppNameForIndex:button.index] stringByAppendingString:@"ViewController"]);
        }
    }
        
    self.appViewController = [[class alloc] init];
    self.appViewController.appButton=button;
    self.appViewController.home=self;
    self.appViewController.view.frame=CGRectMake(0, 0, width, height);
    [self.view.superview addSubview:self.appViewController.view];
    
    // tap position relative to collection view
    float screenX = enclosingView.frame.origin.x + button.center.x;
    float screenY = enclosingView.frame.origin.y + button.center.y; //- self.collectionView.contentOffset.y;
    
    // tap position relative to view frame
    float translateX = (self.view.frame.size.width / -2.0) + screenX;
    float translateY = (self.view.frame.size.height / -2.0) + screenY;
    
    //translateX = button.center.x;
    //translateY = button.center.y;
    
    CATransform3D transform_detail = CATransform3DScale(CATransform3DMakeTranslation(translateX, translateY, 0.0), 0.0, 0.0, 0.0);
    CATransform3D transform_main = CATransform3DScale(CATransform3DMakeTranslation(-translateX * 5.0, -translateY * 5.0, 0.0), 5.0, 5.0, 5.0);
    
    self.appViewController.view.layer.transform = transform_detail;
    
    [UIView animateWithDuration:0.4 animations:^{
        self.appViewController.view.layer.transform = CATransform3DIdentity;
        self.view.layer.transform = transform_main;
    } completion:^(BOOL finished) {
        self.view.layer.transform = CATransform3DIdentity;
    }];
}
- (void)closeApp:(id)sender{
    UIView *enclosingView=self.view;
    
    UIButtonWithIndex *button=(UIButtonWithIndex*)sender;
    
    // tap position relative to collection view
    float screenX = enclosingView.frame.origin.x + button.center.x;
    float screenY = enclosingView.frame.origin.y + button.center.y; //- self.collectionView.contentOffset.y;
    
    // tap position relative to view frame
    float translateX = (self.view.frame.size.width / -2.0) + screenX;
    float translateY = (self.view.frame.size.height / -2.0) + screenY;
    //self.appViewController.view.frame=CGRectMake(button.center.x, button.center.y, 0, 0);
    
    //translateX = button.center.x;
    //translateY = button.center.y;
    
    CATransform3D transform_detail = CATransform3DScale(CATransform3DMakeTranslation(translateX, translateY, 0), 0.00001, 0.00001, 0.00001);
    CATransform3D transform_main = CATransform3DScale(CATransform3DMakeTranslation(-translateX * 5.0, -translateY * 5.0, 0.0), 5.0, 5.0, 5.0);
    
       self.view.layer.transform = transform_main;
       self.appViewController.view.layer.transform = CATransform3DIdentity;
    [UIView animateWithDuration:0.4 animations:^{
       self.appViewController.view.layer.transform = transform_detail;
       self.view.layer.transform = CATransform3DIdentity;
    
    } completion:^(BOOL finished) {
        [self.appViewController.view removeFromSuperview];
        self.appViewController=Nil;
    }];
}

- (void)closeDockApp:(id)sender{
    UIView *enclosingView=self.dock;
    
    UIButtonWithIndex *button=(UIButtonWithIndex*)sender;
    
    // tap position relative to collection view
    float screenX = enclosingView.frame.origin.x + button.center.x;
    float screenY = enclosingView.frame.origin.y + button.center.y; //- self.collectionView.contentOffset.y;
    
    // tap position relative to view frame
    float translateX = (self.view.frame.size.width / -2.0) + screenX;
    float translateY = (self.view.frame.size.height / -2.0) + screenY;
    //self.appViewController.view.frame=CGRectMake(button.center.x, button.center.y, 0, 0);
    
    //translateX = button.center.x;
    //translateY = button.center.y;
    
    CATransform3D transform_detail = CATransform3DScale(CATransform3DMakeTranslation(translateX, translateY, 0), 0.00001, 0.00001, 0.00001);
    CATransform3D transform_main = CATransform3DScale(CATransform3DMakeTranslation(-translateX * 5.0, -translateY * 5.0, 0.0), 5.0, 5.0, 5.0);
    
    self.view.layer.transform = transform_main;
    self.appViewController.view.layer.transform = CATransform3DIdentity;
    [UIView animateWithDuration:0.4 animations:^{
        self.appViewController.view.layer.transform = transform_detail;
        self.view.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        [self.appViewController.view removeFromSuperview];
        self.appViewController=Nil;
    }];
    
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