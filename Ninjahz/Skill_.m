//
//  Skill_.m
//  DueL
//
//  Created by Calvin Cheng on 2013-10-11.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Skill_.h"


@implementation Skill_


-(void)useSkill:(id)sender{
    // start cooldown timer
    [self schedule:@selector(updateCooldown:)interval:1.0f];
    _available = NO;
    
}


-(void) select{
    selected = !selected;
}


-(void)updateCooldown{
    _currentCooldown -= 1;
    if(_currentCooldown == 0){
        //cooldown expired
        _currentCooldown = _defaultCooldown;
        _available = YES;
        [self unschedule:@selector(updateCooldown:)];
    }
}



@end
