#import "Interface.h"
#import "GameLayer.h"

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
        
        [self scheduleUpdate];
        
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
        if (_gameLayer.playerTwo.attacking){
            if (pos.y < _gameLayer.playerTwo.position.y){
                [_gameLayer.playerTwo useSkill:_selectedSkill atTarget:pos];
                
                // tell that player's hude that it has been shot, start cooldown
                [_hud_2 setSelected:FALSE];
            }
            
        
            
        } else {
            
            // move player 2
            targetPos_2 = pos;
            vector_2 = ccpSub(targetPos_2, _gameLayer.playerTwo.position);
            vector_2 = ccpNormalize(vector_2);
            NSLog(@"WALKING");
        }
        
        
    } else{  // player 1 side
        if (_gameLayer.playerOne.attacking){
            if (pos.y > _gameLayer.playerOne.position.y){
                [_gameLayer.playerOne useSkill:_selectedSkill atTarget:pos];
                [_hud_1 setSelected:FALSE];
                
            }
        } else {
            
            // move player 2
            targetPos_1 = pos;
            vector_1 = ccpSub(targetPos_1, _gameLayer.playerOne.position);
            vector_1 = ccpNormalize(vector_1);
            NSLog(@"WALKING");
        }
        
        
    }
    
    
}

-(void)update:(ccTime)dt
{
    
    // Movement Logic
    if(ccpDistance(targetPos_1, _gameLayer.playerOne.position) > 1){
        _gameLayer.playerOne.position = ccpAdd(_gameLayer.playerOne.position, ccpMult(vector_1, player1Speed * dt));
//        NSLog(@"moving player 1");
        [_gameLayer.playerOne backWalk];
        
    } else {
        [_gameLayer.playerOne backIdle];
    }
    
    if(ccpDistance(targetPos_2, _gameLayer.playerTwo.position) > 1){
        _gameLayer.playerTwo.position = ccpAdd(_gameLayer.playerTwo.position, ccpMult(vector_2, player2Speed * dt));
//        NSLog(@"moving player 2 %@", _gameLayer.playerTwo.name);
        [_gameLayer.playerTwo frontWalk];
    } else {
        [_gameLayer.playerTwo frontIdle];
    }
    
    // Targeting Logic
//    if(kActionStateAttack){
//        
//    }
    
}

@end
