//
//  CCAnimation+Helper.m
//  Ninjahz
//
//  Created by Calvin Cheng on 2013-04-30.
//
//

#import "CCAnimation+Helper.h"

@implementation CCAnimation (Helper)

+(CCAnimation *) animationWithFrame:(NSString *)frame
                         frameCount:(int)frameCount
                              delay:(float)delay
{
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:frameCount];
    
    for (int i = 1; i <= frameCount; i++) {
        NSString *file = [NSString stringWithFormat:@"%@%i.png", frame, i];
        
        CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        CCSpriteFrame *frame = [frameCache spriteFrameByName:file];
        [frames addObject:frame];
        
    }
    
    return [CCAnimation animationWithSpriteFrames:frames delay:delay];
}

@end
