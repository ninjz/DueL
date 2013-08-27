#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Nazi.h"
#import "CharacterClass.h"
#import "HudLayer.h"


@class Player;
@class HudLayer;

@interface GameLayer : CCLayer {
    CCSpriteBatchNode *actors;
    float enemyMoveDuration;
    int numEnemies;
    int numEnemiesMoved;
    
    
    
}

@property (strong) CharacterClass *playerOne;
@property (strong) CharacterClass *playerTwo;
@property (nonatomic) HudLayer *hud;

//+(id) scene;
+(GameLayer *) sharedGameLayer;
+(NSMutableArray *) sharedEnemies;


@end
