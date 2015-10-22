//
//  TargetCast.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-31.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TargetCast.h"
#import "Player.h"


@implementation TargetCast

-(id)initWithSpriteFrame:(CCSpriteFrame *)spriteFrame
{
    if(self = [super initWithSpriteFrame:spriteFrame]){
        self.skillType = kTarget;
        
    }
    
    return self;
}

-(void) cast:(id)sender
{
    
    [self.owner setSelectedSkill:self.skillNumber];
    [self.owner setTargeting:![self.owner targeting]];
    
}



@end
