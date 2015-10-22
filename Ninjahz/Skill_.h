//
//  Skill_.h
//  DueL
//
//  Created by Calvin Cheng on 2013-10-11.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface Skill_ : CCSprite {
    BOOL selected;
}

@property(nonatomic,readonly) NSString *name;
@property(nonatomic,readonly) int defaultCooldown;
@property(nonatomic,readonly) int currentCooldown;
@property(nonatomic,readonly) BOOL available;
@property(nonatomic,readonly) NSMutableArray *animations;
@property(nonatomic,readonly) CCSprite *skillIcon;

-(void) useSkill:(id)sender;
-(void) select;
-(void) updateCooldown;




@end
