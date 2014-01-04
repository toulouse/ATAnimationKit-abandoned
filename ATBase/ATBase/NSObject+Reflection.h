//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

@interface NSObject (Reflection)

+ (NSString *)encodedTypeForKeyPath:(NSString *)keyPath;

- (NSString *)encodedTypeForKeyPath:(NSString *)keyPath;

@end
