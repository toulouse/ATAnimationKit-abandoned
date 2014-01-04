//  Copyright (c) 2014 Andrew Toulouse. All rights reserved.

#import "ATAppDelegate.h"

#import <ATBase/DDLog.h>
#import <ATBase/DDASLLogger.h>
#import <ATBase/DDTTYLogger.h>

@implementation ATAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

@end
