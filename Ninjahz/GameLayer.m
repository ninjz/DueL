#import "GameLayer.h"
#import "Nazi.h"
#import "Rambo.h"
#import "Player.h"



@implementation GameLayer

static GameLayer *sharedGameLayer;

+(GameLayer *) sharedGameLayer;
{
    NSAssert(sharedGameLayer != nil, @" instance not yet initialized");
    return sharedGameLayer;
}



-(id) init
{
    if ((self = [super init])){
        sharedGameLayer = self;
        
        // Loading Texture Atlas
        CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache addSpriteFramesWithFile:@"assets.plist" textureFilename:@"assets.png"];
        
        // Background
        CCSprite *test = [CCSprite spriteWithFile:@"TestStage.png"];
        [self addChild:test z:0];
        test.anchorPoint = ccp(0, 0);
        test.position = ccp(0,0);
    
        [self initPlayerOne];
        [self initPlayerTwo];

        [self scheduleUpdate];
        
    }
    
    return self;
}



/** Initializing all the actors in the scene
 */
-(void)initPlayerOne {
    Nazi *nazi = [Nazi node];
    _playerOne = [[Player alloc] initWithCharacter:nazi];
    [self addChild:_playerOne];
    
    [_playerOne setMainPlayer:TRUE];
    _playerOne.position = ccp(SCREEN.width/2,200);
    _playerOne.scale = 1.5;
    [_playerOne setName:@"40CaL"];
    
    
}

-(void)initPlayerTwo {
    Rambo *rambo = [Rambo node];
    _playerTwo = [[Player alloc] initWithCharacter:rambo];
    [self addChild:_playerTwo];
    
    _playerTwo.position = ccp(SCREEN.width/2, SCREEN.height - 200);
//    _playerTwo.rotation = 180;   
    _playerTwo.scale = 1.5;
    [_playerTwo setName:@"GodZilla"];
    [_playerTwo setMainPlayer:FALSE];
    
}









-(void) dealloc
{
    CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
}







-(void)update:(ccTime)delta
{
//    [self reorderActors];
}





@end