//
//  TMSubtitle.h
//  Player
//
//  Created by Nguyễn Khánh Ngọc on 8/12/17.
//  Copyright © 2017 任子丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSubtitle : NSObject

- (instancetype)init:(NSString*)url;
- (NSString*)searchTextSubtitle:(NSTimeInterval)currentPlaybackTime;

@end
