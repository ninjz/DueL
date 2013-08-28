//
//  Skill.h
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Skill : CCSprite {
    
}


@property(nonatomic, assign) BOOL isReady;
@property(nonatomic, assign) BOOL isActive;
@property(nonatomic, assign) BOOL hasSecondary;
@property(nonatomic, assign) NSString *skillIcon;
@property(nonatomic, assign) CCAnimation *animation;
@property(nonatomic, assign) int currentCooldown;
@property(nonatomic, assign) int cooldownTimeMax;



-(void)updateState:(ccTime)dt;

@end
