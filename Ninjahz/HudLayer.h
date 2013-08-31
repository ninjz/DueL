#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Interface.h"
#import "GameLayer.h"


@class GameLayer;
@class Interface;
@interface HudLayer : CCLayer {
    CCLabelTTF *_label;
    CCLabelTTF *_healthBar;
    Player *controllingPlayer;
    NSMutableArray *skillBar;
    
}

@property(nonatomic)GameLayer *gameLayer;
@property (nonatomic) Interface *interface;
@property (nonatomic) BOOL selected;

-(id)initWithPlayer:(Player*)player;
-(void)updateHealthBar;

@end
