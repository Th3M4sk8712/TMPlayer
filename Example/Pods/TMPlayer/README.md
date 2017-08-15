# TMPlayer
A simple video player for iOS, based on ZFPlayer, by renzifeng. Support the vertical, horizontal screen (lock screen direction). Support adjust volume, brigtness and video progress. Extend support subtitle online/offline.

[![CI Status](http://img.shields.io/travis/Nguyễn%20Khánh%20Ngọc/TMPlayer.svg?style=flat)](https://travis-ci.org/Nguyễn%20Khánh%20Ngọc/TMPlayer)
[![Version](https://img.shields.io/cocoapods/v/TMPlayer.svg?style=flat)](http://cocoapods.org/pods/TMPlayer)
[![License](https://img.shields.io/cocoapods/l/TMPlayer.svg?style=flat)](http://cocoapods.org/pods/TMPlayer)
[![Platform](https://img.shields.io/cocoapods/p/TMPlayer.svg?style=flat)](http://cocoapods.org/pods/TMPlayer)

## Features
- Support for horizontal and vertical play mode, in horizontal mode can also lock the screen direction
- Support play with online URL and local file
- Support in TableviewCell playing video
- Adjust brightness by slide vertical at left side of screen
- Adjust volume by slide vertical at right side of screen
- Slide horizontal to fast forward and rewind
- Full screen mode to drag the slider control progress, display video preview
- Download 
- Toggle video resolution
- Subtitle Online/offline (extend feature)

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 8+
- Xcode 8+


## Installation

TMPlayer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TMPlayer"
```
Then, run the following command:

```bash
$ pod install
```

## Usage （Support IB and code）
##### Set status bar color
Please add the "View controller-based status bar appearance" field in info.plist and change it to NO

##### IB usage
Drag IB to UIView,the View class `ZFPlayerView` instead
```objc
// view
ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
// model
ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
playerModel.fatherView = ...
playerModel.videoURL = ...
playerModel.title = ...
[self.playerView playerControlView:controlView playerModel:playerModel];
// delegate
self.playerView.delegate = self;
// Subtitle
self.playerView.addSubtitle(...);
// auto play the video
[self.playerView autoPlayTheVideo];
```

`ZFPlayerDelegate`

```
/** backBtn event */
- (void)zf_playerBackAction;
/** downloadBtn event */
- (void)zf_playerDownload:(NSString *)url;
```

##### Code implementation (Masonry) usage

```objc
self.playerView = [[ZFPlayerView alloc] init];
[self.view addSubview:self.playerView];
[self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
 	make.top.equalTo(self.view).offset(20);
 	make.left.right.equalTo(self.view);
	// Here a 16:9 aspect ratio, can customize the video aspect ratio
    make.height.equalTo(self.playerView.mas_width).multipliedBy(9.0f/16.0f);
}];
// control view（you can custom）
ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
// model
ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
playerModel.fatherView = ...
playerModel.videoURL = ...
playerModel.title = ...
[self.playerView playerControlView:controlView playerModel:playerModel];

// delegate
self.playerView.delegate = self;
// auto play the video
[self.playerView autoPlayTheVideo];
```

## Author

Nguyễn Khánh Ngọc, themaskhenzo@gmail.com

### Reference link：

- [https://segmentfault.com/a/1190000004054258](https://segmentfault.com/a/1190000004054258)
- [http://sky-weihao.github.io/2015/10/06/Video-streaming-and-caching-in-iOS/](http://sky-weihao.github.io/2015/10/06/Video-streaming-and-caching-in-iOS/)
- [https://developer.apple.com/library/prerelease/ios/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/02_Playback.html#//apple_ref/doc/uid/TP40010188-CH3-SW8](https://developer.apple.com/library/prerelease/ios/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/02_Playback.html#//apple_ref/doc/uid/TP40010188-CH3-SW8)

---
### Object-C Player:
See the [ZFPlayer](https://github.com/renzifeng/ZFPlayer) please, thanks the ZFPlayer author's open source.

---
### Swift Player:
See the [BMPlayer](https://github.com/BrikerMan/BMPlayer) please, thanks the BMPlayer author's open source.

## License

TMPlayer is available under the MIT license. See the LICENSE file for more info.
