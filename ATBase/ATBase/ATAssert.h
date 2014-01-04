//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATBaseDefines.h"

#define ATAssert(condition, ...) [ATAssert _internalAssertWithCondition:(BOOL)(condition) \
                                                         prettyFunction:__PRETTY_FUNCTION__ \
                                                                   file: __FILE__ \
                                                                   line: __LINE__ \
                                                                 format:__VA_ARGS__]
#define ATFailAssert(...) ATAssert(NO, ##__VA_ARGS__)

#define AT_IMPLEMENTED_BY_SUBCLASS ATFailAssert(@"Must be implemented by subclass!")

@interface ATAssert : NSObject

+ (void)_internalAssertWithCondition:(BOOL)condition
                      prettyFunction:(const char *)prettyFunc
                                file:(const char *)file
                                line:(int)line
                              format:(NSString *)format, ... __attribute__ ((format (__NSString__, 5, 6)));

@end
