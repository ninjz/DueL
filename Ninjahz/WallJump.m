
#import "WallJump.h"
#import "Player.h"


@implementation WallJump

-(id)init
{
    if (self = [super initWithSpriteFrameName:@"fireball_up1.png"]){
        
        // cooldown
        self.isReady = YES;
        self.isActive = NO;
        self.hasSecondary = YES;
        self.nearWall = NO;
        self.owner = nil;
        
        self.currentCooldown = 0;
        self.cooldownTimeMax = 10;
        self.skillIcon = @"Spell_frost_windwalkon.png";
    }
    return self;
}

-(void) activate
{
    //check player position
    if (self.owner.position.x <= 10) {
        // set player to Stunned
        self.owner.actionState = kActionStateStunned;
        // shedule update ?? if has secondary
        
        if (self.hasSecondary == YES) {
            [self scheduleUpdate];
        }
        // store old player speed
        int speed = [self.owner speed];
        [self.owner setSpeed:1000];
        
        CGPoint target = ccp(SCREEN.width, self.owner.position.y);
        // move player with function (run skill animation)
        [self.owner specialmovePlayer:target];
        
        // set speed back to normal
        [self.owner setSpeed:speed];
        
        // set player to un-stunned
        self.owner.actionState = kActionStateIdle;
        
    }
}

-(void) secondaryActivate
{
    
}

-(void)update:(ccTime)dt
{
    // wait for another buttom press
    [self secondaryActivate];
    
}



@end
