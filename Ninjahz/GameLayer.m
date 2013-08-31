#import "GameLayer.h"
#import "Nazi.h"
#import "Rambo.h"
#import "Player.h"
#import "ProjectileCache.h"
#import "ProjectileSkill.h"



@implementation GameLayer

static GameLayer *sharedGameLayer;

+(GameLayer *) sharedGameLayer;
{
    NSAssert(sharedGameLayer != nil, @" instance not yet initialized");
    return sharedGameLayer;
}

static NSMutableArray *players;

+(NSMutableArray *) sharedPlayers;
{
//    NSAssert(players != nil, @" instance not yet initialized");
    return players;
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
        
        players = [NSMutableArray arrayWithCapacity:2];
        
        [self initPlayerOne];
        NSLog(@"player one initialized");
        [self initPlayerTwo];
        NSLog(@"player two initialized");
        
    }
    
    return self;
}



/** Initializing all the actors in the scene
 */
-(void)initPlayerOne {
    Nazi *nazi = [Nazi node];
    _playerOne = [[Player alloc] initWithCharacter:nazi asPlayer:1 withName:@"god" atPosition:ccp(SCREEN.width/2,200)];
    [_playerOne initSkills];
    [self addChild:_playerOne z:10];
    
    
    [_playerOne setMainPlayer:TRUE];
    _playerOne.scale = 1.5;
    
    // z:20 which is infront of player 2 so that sprite looks like it is hitting the top guy
    for (int i = 0 ; i < 5; i ++ ){
        [self addChild:[_playerOne.equippedSkills objectAtIndex:i] z:9];
        
    }
    
    // set the owner of each skill cache
//    for (Skill *skill in _playerOne.equippedSkills){
//        NSLog(@"%i", skill.skillType);
//        if (skill.skillType != kProjectile){
//            [skill setOwner:_playerOne];
//        } else {
//            ProjectileSkill * temp = (ProjectileSkill *)skill;
//            [temp.cache setOwner:_playerOne];
//        }
//        
//    }
    
    
    [players addObject:_playerOne];
    
}

-(void)initPlayerTwo {
    Rambo *rambo = [Rambo node];
    _playerTwo = [[Player alloc] initWithCharacter:rambo asPlayer:2 withName:@"Godzilla" atPosition:ccp(SCREEN.width/2, SCREEN.height - 200)];
    [_playerTwo initSkills];
    
    [self addChild:_playerTwo z:5];
    
//    _playerTwo.rotation = 180;   
    _playerTwo.scale = 1.5;
    [_playerTwo setMainPlayer:FALSE];
    
    // z:5 so on collision goes under player 1
    for (int i = 0; i < 5; i++){
        [self addChild:[_playerTwo.equippedSkills objectAtIndex:i] z:3];
    }
    
    
    // set the owner of each skill cache
//    for (Skill *skill in _playerTwo.equippedSkills){
//        if (skill.skillType != kProjectile){
//            [skill setOwner:_playerTwo];
//        } else {
//            
//            ProjectileSkill * temp = (ProjectileSkill *)skill;
//            [temp.cache setOwner:_playerTwo];
//        }
//        
//    }
    
//    [[_playerTwo.equippedSkills objectAtIndex:0] setRotation:180];
    
    [players addObject:_playerTwo];
}









-(void) dealloc
{
    CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
}











@end