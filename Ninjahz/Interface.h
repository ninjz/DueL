#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@class HudLayer;
@class GameLayer;
@interface Interface : CCLayer {
    CGPoint currPos;
    CGPoint targetPos_1;
    CGPoint targetPos_2;
    
    CGPoint vector_1;
    CGPoint vector_2;
    
    int player1Speed;
    int player2Speed;
    
    
    
    // Player Boundaries
    int maxHeight;
    int minHeight;
    int maxWidth;
    int minWidth;
}

// player 1 hud
@property (nonatomic) HudLayer *hud_1;
// player 2 hud
@property (nonatomic) HudLayer *hud_2;



@property (nonatomic) GameLayer *gameLayer;
@property (nonatomic) int selectedSkill;

@end
