//
//  TMViewController.m
//  TMPlayer
//
//  Created by Nguyễn Khánh Ngọc on 08/14/2017.
//  Copyright (c) 2017 Nguyễn Khánh Ngọc. All rights reserved.
//

#import "TMViewController.h"
#import "ZFPlayer.h"
#import "ZFAVPlayerManager.h"
#import "ZFPlayerControlView.h"
#import "UIView+ZFFrame.h"

@interface TMViewController ()

@property (weak, nonatomic)  IBOutlet UIView *containerView;

@property (nonatomic, strong) ZFPlayerController *player;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation TMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.playerView = [[ZFPlayerView alloc] init];
//    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
//    playerModel.fatherView = _playerFatherView;
//    playerModel.videoURL = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
//    playerModel.title = @"Big Buck Bunny";
//    self.playerView.hasDownload = NO;
//    self.playerView.hasPreviewView = YES;
//    [self.playerView playerControlView: nil playerModel:playerModel];
    //[self.playerView addSubtitleURL:@"..."];
    //[self.playerView resetToPlayNewVideo:playerModel];
  
  [self initPlayerView];
  self.player.forceDeviceOrientation = YES;
}

- (void)initPlayerView {
  ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
  self.player = [[ZFPlayerController alloc] initWithPlayerManager:playerManager containerView:self.containerView];
  self.player.controlView = self.controlView;
  @weakify(self)
  self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
      @strongify(self)
      [self setNeedsStatusBarAppearanceUpdate];
  };
  
  NSString *URLString = [@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
  playerManager.assetURL = [NSURL URLWithString:URLString];
  
  [self.controlView showTitle:@"Big Buck Bunny" coverURLString:@"https://upload-images.jianshu.io/upload_images/635942-14593722fe3f0695.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" fullScreenMode:ZFFullScreenModeLandscape];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.player.isFullScreen) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return self.player.isStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
  return UIStatusBarAnimationSlide;
}

- (BOOL)shouldAutorotate {
    return self.player.shouldAutorotate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - about keyboard orientation

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.player.isFullScreen) {
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
    }
    return _controlView;
}

@end
