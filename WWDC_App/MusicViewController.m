//
//  MusicViewController.m
//  WWDC_App
//
//  Created by Romi Phadte on 4/26/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

#import "MusicViewController.h"
#import <Parallax/ACParallaxView.h>
#import <AVFoundation/AVFoundation.h>
#import "AudioController.h"

@interface MusicViewController ()

@property (weak,nonatomic) NSURL *soundFileURL;
@property (weak,nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@property (strong,nonatomic) AudioController *audioController;


@end

@implementation MusicViewController

AVAudioPlayer* click;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.audioController = [[AudioController alloc] init];
    //[self.audioController tryPlayMusic];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]                                                                                                                  pathForResource:@"a" ofType:@"mp3"]];
    click= [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile  error:nil];
    [click play];
    
    
//    NSError *error;
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"addicted" ofType:@"mp3"];
//    self.backgroundMusicPlayer = [[AVAudioPlayer alloc]
//                                  initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
//    self.backgroundMusicPlayer.delegate=self;
//    [self.backgroundMusicPlayer prepareToPlay];
//    [self.backgroundMusicPlayer play];
    
    
//    
//    AVAudioPlayer* audioPlayer = [[AVAudioPlayer alloc ] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
//    [audioPlayer prepareToPlay];
//    [audioPlayer play];
    
    
    
//
//    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"addicted" ofType:@"mp3"];
//    NSURL *newURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
//    self.soundFileURL = newURL;
//    [[AVAudioSession sharedInstance] setDelegate: self];
//    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryAmbient error: nil];
//    
//    // Registers the audio route change listener callback function
//    //AudioSessionAddPropertyListener (
//    //                                 kAudioSessionProperty_AudioRouteChange,
//     //                                audioRouteChangeListenerCallback,
//      //                               self
//       //                              );
//    
//    // Activates the audio session.
//    
//    NSError *activationError = nil;
//    [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
//    
//    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: _soundFileURL error: nil];
//    self.appSoundPlayer = newPlayer;
//    [_appSoundPlayer prepareToPlay];
//    [_appSoundPlayer setVolume: 1.0];
//    [_appSoundPlayer setDelegate: self];
//    [_appSoundPlayer play];
//    
//
//    [stopbutton setEnabled:YES];
//    [playbutton setEnabled: NO];
//    playbutton.hidden=YES;
//    pausebutton.hidden =NO;
    
    
}


- (void)delayAction{
    [[[UIAlertView alloc]initWithTitle:@"No Music Available" message:@"App will quit" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
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
