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
        
        // Player 1 Boundary
        maxHeight = SCREEN.height/2;
        minHeight = 50;
        maxWidth = SCREEN.width;
        minWidth = 0;
        
        [self scheduleUpdate];
        
    }
    return self;
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    CGPoint pos;
    pos = [[CCDirector sharedDirector] convertToGL:location];
    if (pos.y > SCREEN.height/2){
        // move player 2
        targetPos_2 = pos;
        vector_2 = ccpSub(targetPos_2, _gameLayer.playerTwo.position);
        vector_2 = ccpNormalize(vector_2);
        
    } else{
        // move player 1
        targetPos_1 = pos;
        vector_1 = ccpSub(targetPos_1, _gameLayer.playerOne.position);
        vector_1 = ccpNormalize(vector_1);
    }
    
    
}

-(void)update:(ccTime)dt
{
    if(ccpDistance(targetPos_1, _gameLayer.playerOne.position) > 1){
        _gameLayer.playerOne.position = ccpAdd(_gameLayer.playerOne.position, ccpMult(vector_1, player1Speed * dt));
//        NSLog(@"moving player 1");
    }
    
    if(ccpDistance(targetPos_2, _gameLayer.playerTwo.position) > 1){
        _gameLayer.playerTwo.position = ccpAdd(_gameLayer.playerTwo.position, ccpMult(vector_2, player2Speed * dt));
        NSLog(@"moving player 2 %@", _gameLayer.playerTwo.name);
    }
    
    
    
}

@end
