//
//  Defines.h
//  Ninjahz
//
//  Created by Calvin Cheng on 2013-04-30.
//
//

#ifndef Ninjahz_Defines_h
#define Ninjahz_Defines_h

// 1 - convenience measurements
#define SCREEN [[CCDirector sharedDirector] winSize]
#define CENTER ccp(SCREEN.width/2, SCREEN.height/2)
#define CURTIME CACurrentMediaTime()

// 2 - convenience functions
#define random_range(low,high) (arc4random()%(high-low+1))+low
#define frandom (float)arc4random()/UINT64_C(0x100000000)
#define frandom_range(low,high) ((high-low)*frandom)+low

// 3 - enumerations
typedef enum _ActionState {
    kActionStateNone = 0,
    kActionStateIdle,
    kActionStateAttack,
    kActionStateWalkForward,
    kActionStateWalkRight,
    kActionStateWalkRightDiag,
    kActionStateWalkLeft,
    kActionStateWalkLeftDiag,
    kActionStateWalkBack,
    kActionStateStunned,
    kActionStateHurt,
    kActionStateKnockedOut,
    kActionStateDead
} ActionState;

typedef enum _Projectile {
    kFireBall = 0,
    kIceBlast,
    kPyroBlast,
    kFrostStorm,
    kTsunamiBlast,
} Projectile;

typedef enum _SkillType {
    kProjectile = 0,
    kInstant,
    kTarget,
    kAOE,
} SkillType;







// 4 - structures
typedef struct _BoundingBox {
    CGRect actual;
    CGRect original;
} BoundingBox;


#endif
