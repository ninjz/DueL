#import <Foundation/Foundation.h>
#import "cocos2d.h"

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

@property (nonatomic) HudLayer *hud;
@property (nonatomic) GameLayer *gameLayer;

@end
