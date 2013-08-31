//
//  InstantCast.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-30.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "InstantCast.h"


@implementation InstantCast

-(id)initWithSpriteFrame:(CCSpriteFrame *)spriteFrame
{
    if(self = [super initWithSpriteFrame:spriteFrame]){
        self.skillType = kInstant;
        
    }
    
    return self;
}

@end
