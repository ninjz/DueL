//
//  TargetCast.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-31.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Skill.h"

@interface TargetCast : Skill {
    
}

-(void)activateAtTarget:(CGPoint)target;

@end
