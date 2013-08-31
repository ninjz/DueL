#import "Interface.h"
#import "GameLayer.h"
#import "Player.h"

/** This is the controlling interface for Local Multiplayer **/
@implementation Interface

-(id)init {
    if((self = [super init])) {
        self.isTouchEnabled = YES;
        _gameLayer = [GameLayer sharedGameLayer];
        player1Speed = [_gameLayer.playerOne speed];
        player2Speed = [_gameLayer.playerTwo speed];
        
        
        targetPos_1 = _gameLayer.playerOne.position;
        targetPos_2 = _gameLayer.playerTwo.position;
        
        // Player 1 Boundary
        maxHeight = SCREEN.height/2;
        minHeight = 50;
        maxWidth = SCREEN.width;
        minWidth = 0;
        
        _selectedSkill = nil;
        
        
    }
    return self;
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    CGPoint pos;
    pos = [[CCDirector sharedDirector] convertToGL:location];
    
    // player 2 side
    if (pos.y > SCREEN.height/2){
        if (_gameLayer.playerTwo.targeting){
            if (pos.y < _gameLayer.playerTwo.position.y){
                [_gameLayer.playerTwo useSkill:_gameLayer.playerTwo.selectedSkill atTarget:pos];
                
                // tell that player's hude that it has been shot, start cooldown
                [_hud_2 setSelected:FALSE];
            } else { // let player move again
                [_gameLayer.playerTwo movePlayer:pos];

            }
            
        
            
        } else {
            
            // move player 2
             [_gameLayer.playerTwo movePlayer:pos];
        }
        
        
    } else{  // player 1 side
        if (_gameLayer.playerOne.targeting){
            NSLog(@"targeting");
            if (pos.y > _gameLayer.playerOne.position.y){
                [_gameLayer.playerOne useSkill:_gameLayer.playerOne.selectedSkill atTarget:pos];
                [_hud_1 setSelected:FALSE];
                
            } else{
                 [_gameLayer.playerOne movePlayer:pos];
                
            }
        } else {
            
            // move player 2
            [_gameLayer.playerOne movePlayer:pos];
        }
        
        
    }
    
    
}

-(void)update:(ccTime)dt
{
    
    
    
}

@end
