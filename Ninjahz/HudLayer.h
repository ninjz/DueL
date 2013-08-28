#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "GameLayer.h"


@class GameLayer;
@interface HudLayer : CCLayer {
    CCLabelTTF *_label;
    Player *controllingPlayer;
    
}

@property(nonatomic)GameLayer *gameLayer;

-(id)initWithPlayer:(Player*)player;

@end
