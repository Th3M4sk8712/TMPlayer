//
//  TMSubtitle.m
//  Player
//
//  Created by Nguyễn Khánh Ngọc on 8/12/17.
//  Copyright © 2017 任子丰. All rights reserved.
//

#import "TMSubtitle.h"

@implementation TMSubtitle {
    NSMutableArray *subtitlesParts;
}

- (instancetype)init:(NSString *)url {
    self = [super init];
    if (self != nil) {
        subtitlesParts = [NSMutableArray array];
        [self requestGetSubtitle:url];
    }
    return self;
}

- (void)requestGetSubtitle:(NSString *)url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
        [self parseSRTString:requestReply];
    }] resume];
}

- (void)parseSRTString:(NSString *)string {
    NSScanner *scanner = [NSScanner scannerWithString:string];
    
    while (![scanner isAtEnd]) {
        NSString *indexString;
        (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&indexString];
        
        NSString *startString;
        (void) [scanner scanUpToString:@" --> " intoString:&startString];
        
        // My string constant doesn't begin with spaces because scanners
        // skip spaces and newlines by default.
        (void) [scanner scanString:@"-->" intoString:NULL];
        
        NSString *endString;
        (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&endString];
        
        NSString *textString;
        // (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&textString];
        // BEGIN EDIT
        (void) [scanner scanUpToString:@"\r\n\r\n" intoString:&textString];
        textString = [textString stringByReplacingOccurrencesOfString:@"\r\n" withString:@" "];
        // Addresses trailing space added if CRLF is on a line by itself at the end of the SRT file
        textString = [textString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        // END EDIT
        
        NSDictionary *dictionary = @{@"index" : indexString,
                                     @"start" : @([self timeFromString: startString]),
                                     @"end" : @([self timeFromString: endString]),
                                     @"text" : textString};
        [subtitlesParts addObject:dictionary];
    }
}

- (NSString*)searchTextSubtitle:(NSTimeInterval)currentPlaybackTime {
    NSPredicate *initialPredicate = [NSPredicate predicateWithFormat:@"(%@ >= %K) AND (%@ <= %K)", @(currentPlaybackTime), @"start", @(currentPlaybackTime), @"end"];
    NSArray *objectsFound = [subtitlesParts filteredArrayUsingPredicate:initialPredicate];
    NSDictionary *lastFounded = (NSDictionary *)[objectsFound lastObject];
    return lastFounded[@"text"];
}

- (NSTimeInterval)timeFromString:(NSString *)timeString {
    NSScanner *scanner = [NSScanner scannerWithString:timeString];
    int h, m, s, c;
    [scanner scanInt:&h];
    [scanner scanString:@":" intoString:NULL];
    [scanner scanInt:&m];
    [scanner scanString:@":" intoString:NULL];
    [scanner scanInt:&s];
    [scanner scanString:@"," intoString:NULL];
    [scanner scanInt:&c];
    return (h * 3600) + (m * 60) + s + (c / 1000.0);
}

@end
