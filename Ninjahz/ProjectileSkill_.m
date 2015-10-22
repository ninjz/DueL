//
//  ProjectileSkill_.m
//  DueL
//
//  Created by Calvin Cheng on 2013-10-12.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ProjectileSkill_.h"


@implementation ProjectileSkill_

-(void)Use_Skill:(id)sender{
    
}

-(void)Hit
{
    //damage player
    
    
    //play hit sound
    [[SimpleAudioEngine sharedEngine] stopEffect:effect];
    effect = [[SimpleAudioEngine sharedEngine] playEffect:@"--SOUND GOES HERE--"];
    
    //play hit animation
    
}

@end


