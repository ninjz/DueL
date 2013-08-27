#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CharacterClass.h"
#import "GameLayer.h"


@class GameLayer;
@interface HudLayer : CCLayer {
    CCLabelTTF *_label;
    CharacterClass *controllingPlayer;
    
}

@property(nonatomic)GameLayer *gameLayer;

-(id)initWithPlayer:(CharacterClass*)player;

@end
