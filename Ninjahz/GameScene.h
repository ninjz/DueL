#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameLayer.h"
#import "HudLayer.h"
#import "Interface.h"

@interface GameScene : CCScene {
    
}

@property(nonatomic)GameLayer *gameLayer;
@property(nonatomic)HudLayer *hudLayer_1;
@property(nonatomic)HudLayer *hudLayer_2;
@property(nonatomic)Interface *interfaceLayer;


+(GameScene *) sharedGameScene;

@end
