//  Created by Andrew Toulouse on 12/27/13.

#import "ATBasicAnimation.h"
#import "ATPropertyAnimation_Subclass.h"

@implementation ATBasicAnimation

- (BOOL)shouldStopAtTime:(CFTimeInterval)time
{
    CFTimeInterval timeSinceStart = (time - self.beganTime);
    return timeSinceStart >= self.duration;
}

- (void)applyAnimationAtTime:(CFTimeInterval)time
{
    [super applyAnimationAtTime:time];
    
    if ([self shouldStopAtTime:time]) {
        return;
    }

    const CFTimeInterval timeSinceStart = (time - self.beganTime);
    self.percent = timeSinceStart / self.duration;
}

@end
