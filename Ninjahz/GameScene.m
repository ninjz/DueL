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
        
        // HUD
        _hudLayer_1 = [[HudLayer alloc]initWithPlayer:[_gameLayer playerOne]];
        [self addChild:_hudLayer_1 z:20];
        _hudLayer_2 = [[HudLayer alloc]initWithPlayer:[_gameLayer playerTwo]];
        [self addChild:_hudLayer_2 z:20];
        _hudLayer_2.rotation = 180;
        
        // Interface
        _interfaceLayer = [Interface node];
        [self addChild:_interfaceLayer z:2];
        
        
        // multi-layer communication
        _gameLayer.hud = _hudLayer_1;
        
        _hudLayer_1.interface = _interfaceLayer;
        _hudLayer_2.interface = _interfaceLayer;
        
        _interfaceLayer.hud_1 = _hudLayer_1;
        _interfaceLayer.hud_2 = _hudLayer_2;
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"BloodyTears.mp3"];
        [[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume:0.5f];
        [[SimpleAudioEngine sharedEngine] setEffectsVolume:1.0f];
        
    }
    return self;
}




@end
