//
//  Nazi.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-25.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Nazi.h"
#import "CCAnimation+Helper.h"
#import "NormalNazi.h"
#import "ProjectileCache.h"


@implementation Nazi

-(id) init{
    if (self = [super init]){
        self.startingHp = 100;
        self.maxHp = 100;
        self.maxLevel = 30;
        self.speed = 100;
        
        // Skills go here!
        ProjectileCache *fireball = [[ProjectileCache alloc] initWithProjectile:kFireBall];
        ProjectileCache *iceblast = [[ProjectileCache alloc] initWithProjectile:kIceBlast];
        ProjectileCache *pyroblast = [[ProjectileCache alloc] initWithProjectile:kPyroBlast];
        ProjectileCache *froststorm = [[ProjectileCache alloc] initWithProjectile:kFrostStorm];
        ProjectileCache *tsunamiblast = [[ProjectileCache alloc] initWithProjectile:kTsunamiBlast];
        
        
        // Skins go here!
        NormalNazi *normalNazi = [NormalNazi node];

        
        // initializing all containers
        
        // All existing skins for this class
        NSMutableArray *skins = [[NSMutableArray alloc] initWithArray:@[normalNazi]];
        self.allSkins = skins;
        
        // All existing skills for this class
        NSMutableArray *skills = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast]];
        self.allSkills = skills;
        
        
        /** DEFAULT**/

            // --default skills for class-- skills currently equipped (5 max currently.)
            NSMutableArray *equippedSkills = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast]];
            self.equippedSkills = equippedSkills;
        
            
            
            // --default skills for class has to be in this array--
            NSMutableArray *skillsKnown = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast]];
            self.skillsKnown = skillsKnown;
        
            // --default skin for class--
            self.equippedSkin = normalNazi;
            
            // --default skin for class has to be in this array--
            NSMutableArray *skinsOwned = [[NSMutableArray alloc] initWithArray:@[normalNazi]];
            self.ownedSkins = skinsOwned;

    }
    
    return self;
}






@end
