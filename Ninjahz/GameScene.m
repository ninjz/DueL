//
//  GameScene.m
//  Ninjahz
//
//  Created by Calvin Cheng on 2013-05-07.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "SimpleAudioEngine.h"
#import "GameScene.h"
#import "HudLayer.h"



@implementation GameScene
static GameScene *sharedGameScene;

+(GameScene *) sharedGameScene;
{
    NSAssert(sharedGameScene != nil, @" instance not yet initialized");
    return sharedGameScene;
}

-(id)init {
    sharedGameScene = self;
    
    if((self = [super init])){
        _gameLayer = [GameLayer node];
        [self addChild:_gameLayer z:0];
        
        
        _hudLayer_1 = [[HudLayer alloc]initWithPlayer:[_gameLayer playerOne]];
        [self addChild:_hudLayer_1 z:20];
        _hudLayer_2 = [[HudLayer alloc]initWithPlayer:[_gameLayer playerTwo]];
        [self addChild:_hudLayer_2 z:20];
        _hudLayer_2.rotation = 180;
        
        
        
        _interfaceLayer = [Interface node];
        [self addChild:_interfaceLayer z:2];
//
//        
        _gameLayer.hud = _hudLayer_1;
//        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"music.mp3"];
        
    }
    return self;
}




@end
