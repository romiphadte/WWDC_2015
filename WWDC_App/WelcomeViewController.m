//
//  WelcomeViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/28/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "WelcomeViewController.h"
#import "RNPHomeScreenViewController.h"

@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@property (strong, nonatomic) NSArray *strings;
@property int index;
@property (weak, nonatomic) IBOutlet UIButton *slideLabel;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    _strings=@[@"Hello",@"Hola",@"Salut",@"Ciao!",@"Ahoj!"];
    _index=1;
    
    [super viewDidLoad];
    NSTimer* timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(update) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.backgroundColor = [[UIColor colorWithRed:0.0f green:0.0f blue:0.0f  alpha:0.85f] CGColor];
    maskLayer.contents = (id)[[UIImage imageNamed:@"milkyway.png"] CGImage];
    
    maskLayer.contentsGravity = kCAGravityCenter;
    maskLayer.frame = CGRectMake(_slideLabel.frame.size.width * -1, 0.0f,   _slideLabel.frame.size.width * 2, _slideLabel.frame.size.height);
    // Animate the mask layer's horizontal position
    CABasicAnimation *maskAnim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    maskAnim.byValue = [NSNumber numberWithFloat:_slideLabel.frame.size.width];
    maskAnim.repeatCount = 1e38f;
    maskAnim.duration = 1.5f;
    [maskLayer addAnimation:maskAnim forKey:@"slideAnim"];
    _slideLabel.layer.mask = maskLayer;
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)showHomeScreen:(id)sender {
    [[self navigationController]pushViewController:[[RNPHomeScreenViewController alloc]init] animated:YES];
    
    //[[self navigationController] presentViewController:[[RNPHomeScreenViewController alloc] init] animated:YES completion:^{
        
    //}];
//    
//    UIView *enclosingView=self.view;
//    CGRect screenSize=[UIScreen mainScreen].bounds;
//    CGFloat width=screenSize.size.width;
//    CGFloat height=screenSize.size.height;
//    
//    // tap position relative to collection view
//    float screenX = enclosingView.frame.origin.x;
//    float screenY = enclosingView.frame.origin.y; //- self.collectionView.contentOffset.y;
//    
//    // tap position relative to view frame
//    float translateX = (self.view.frame.size.width / -2.0) + screenX;
//    float translateY = (self.view.frame.size.height / -2.0) + screenY;
//    //self.appViewController.view.frame=CGRectMake(button.center.x, button.center.y, 0, 0);
//    
//    //translateX = button.center.x;
//    //translateY = button.center.y;
//    
//    CATransform3D transform_detail = CATransform3DScale(CATransform3DMakeTranslation(translateX, translateY, 0), 0.00001, 0.00001, 0.00001);
//    CATransform3D transform_main = CATransform3DScale(CATransform3DMakeTranslation(-translateX * 5.0, -translateY * 5.0, 0.0), 5.0, 5.0, 5.0);
//    RNPHomeScreenViewController *homeview=[[RNPHomeScreenViewController alloc] init];
//    
//    homeview.view.layer.transform = transform_main;
//    self.view.layer.transform = CATransform3DIdentity;
//    [UIView animateWithDuration:0.4 animations:^{
//        self.view.layer.transform = transform_detail;
//        homeview.view.layer.transform = CATransform3DIdentity;
//        
//    } completion:^(BOOL finished) {
//        [self.view removeFromSuperview];
//        //self.appViewController=Nil;
//    }];
    
}

- (void)update{
    if (_index>=[_strings count]){
        _index=0;
    }
    CATransition *animation = [CATransition animation];
    animation.duration = 1.0;
    animation.type = kCATransitionFade;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_helloLabel.layer addAnimation:animation forKey:@"changeTextTransition"];
    _helloLabel.text=@"";
    
    
    [_slideLabel.layer addAnimation:animation forKey:@"changeTextTransition"];
    [_slideLabel setTitle:@"Tap to learn more about Romi" forState:UIControlStateNormal];
    
    
    [self performSelector:@selector(updatePart2) withObject:nil afterDelay:1.0];
   
}

-(void)updatePart2{
    CATransition *animation = [CATransition animation];
    animation.duration = 1.0;
    animation.type = kCATransitionFade;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_helloLabel.layer addAnimation:animation forKey:@"changeTextTransition"];
    [_helloLabel.layer addAnimation:animation forKey:@"changeTextTransition"];
    _helloLabel.text=_strings[_index];
    _index++;
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
