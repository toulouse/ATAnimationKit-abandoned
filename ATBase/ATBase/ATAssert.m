//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATAssert.h"

#import "ATLog.h"

@implementation ATAssert

+ (void)_internalAssertWithCondition:(BOOL)condition
                      prettyFunction:(const char *)prettyFunc
                                file:(const char *)file
                                line:(int)line
                              format:(NSString *)format, ...
{
    if (format) {
        va_list args;
        va_start(args, format);

        NSString *logMessage = [[NSString alloc] initWithFormat:format arguments:args];
        NSLog(@"Assertion in %s:%d:\n%@", file, line, logMessage);

        if (!condition) {
            abort();
        }

        va_end(args);
    }
}

@end
