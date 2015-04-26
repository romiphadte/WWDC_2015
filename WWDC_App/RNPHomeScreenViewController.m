//
//  RNPHomeScreenViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "RNPHomeScreenViewController.h"
#import "AppScreenViewController.h"

@interface RNPHomeScreenViewController ()

@property (nonatomic,strong) UIView* firstPage;
@property (assign) BOOL pageControlUsed;
@property (assign) NSUInteger page;
@property (assign) BOOL rotating;
@property (nonatomic, strong) UIScrollView *scrollView;
- (void)loadScrollViewWithPage:(int)page;

@end

@implementation RNPHomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenSize=[UIScreen mainScreen].bounds;
    CGFloat width=screenSize.size.width;
    CGFloat height=screenSize.size.height;
   
    UIImage* backgroundImage=[UIImage imageNamed:@"milkyway"];
    UIImageView* background=[[UIImageView alloc] initWithImage:backgroundImage];
    background.frame=CGRectMake(0, 0, width, height);
    [self.view addSubview:background];
    
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
    
    AppScreenViewController* one=[[AppScreenViewController alloc]init];
    AppScreenViewController* two=[[AppScreenViewController alloc]init];
    
    [self addChildViewController:one];
    [self addChildViewController:two];
    
//    
//    UIButton *messages=[[UIButton alloc] initWithFrame:CGRectMake(30, 40, 60, 60)];
//    [messages setBackgroundImage:[UIImage imageNamed:@"messages"] forState:UIControlStateNormal];
//    [self.firstPage addSubview:messages];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (NSUInteger i =0; i < [self.childViewControllers count]; i++) {
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