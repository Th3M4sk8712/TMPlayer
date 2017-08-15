//
//  TMViewController.m
//  TMPlayer
//
//  Created by Nguyễn Khánh Ngọc on 08/14/2017.
//  Copyright (c) 2017 Nguyễn Khánh Ngọc. All rights reserved.
//

#import "TMViewController.h"
#import "ZFPlayer.h"

@interface TMViewController ()

@property (weak, nonatomic)  IBOutlet UIView *playerFatherView;
@property (strong, nonatomic) ZFPlayerView *playerView;

@end

@implementation TMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.playerView = [[ZFPlayerView alloc] init];
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
    playerModel.fatherView = _playerFatherView;
    playerModel.videoURL = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    playerModel.title = @"Big Buck Bunny";
    self.playerView.hasDownload = NO;
    self.playerView.hasPreviewView = YES;
    [self.playerView playerControlView: nil playerModel:playerModel];
    [self.playerView addSubtitleURL:@"http://subtitle.hdcinemaz.com:1988/2016/The.Ten.Deadly.Sins.2016.e1.srt"];
    [self.playerView autoPlayTheVideo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
