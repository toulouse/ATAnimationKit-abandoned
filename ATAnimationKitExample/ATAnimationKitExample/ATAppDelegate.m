//  Copyright (c) 2014 Andrew Toulouse. All rights reserved.

#import "ATAppDelegate.h"

#import <ATBase/ATLog.h>
#import <ATBase/DDLog.h>
#import <ATBase/DDASLLogger.h>
#import <ATBase/DDTTYLogger.h>
#import <ATBase/NSValue+Helpers.h>

#import <ATAnimationKit/ATAnimationKit.h>

#import <QuartzCore/QuartzCore.h>

@interface ATAppDelegate () <ATAnimationDelegate>

@end

@implementation ATAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    [[ATAnimator sharedAnimator] start];

    // Add layer (any KVC-compliant Objective-C property will do)
    NSView *contentView = self.window.contentView;
    contentView.wantsLayer = YES;

    CALayer *someLayer = [CALayer layer];
    someLayer.frame = CGRectMake(0, 0, 30, 30);
    someLayer.backgroundColor = [NSColor blueColor].CGColor;

    [contentView.layer addSublayer:someLayer];

    // Calculate a final rect that's at the top right corner
    CGRect windowRect = contentView.layer.bounds;
    CGFloat width = CGRectGetWidth(windowRect);
    CGFloat height = CGRectGetHeight(windowRect);
    CGRect toRect = CGRectMake(width - 150, height - 150, 150, 150);

    // Animate
    ATBasicAnimation *animation = [ATBasicAnimation animationWithObject:someLayer keyPath:@"frame"];
    animation.toValue = [NSValue valueWithCGRect:toRect];
    animation.duration = 2;
    animation.delegate = self;

    [[ATAnimator sharedAnimator] addAnimation:animation forKey:@"someIdentifier"];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    [[ATAnimator sharedAnimator] stop];
}

- (void)animationDidStart:(ATAnimation *)animation
{
    ATLogDebug(@"Started: %@", animation);
}

- (void)animationDidStop:(ATAnimation *)animation finished:(BOOL)finished
{
    ATLogDebug(@"Stopped: %@ finished: %d", animation, finished);
}

@end
