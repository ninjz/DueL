//
//  Rambo.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Rambo.h"
#import "CCAnimation+Helper.h"
#import "ProjectileCache.h"
#import "Fireball.h"
#import "Iceblast.h"
#import "Pyroblast.h"
#import "FrostStorm.h"
#import "TsunamiBlast.h"
#import "NormalRambo.h"


@implementation Rambo

-(id) init{
    if (self = [super init]){
        self.startingHp = 100;
        self.maxHp = 100;
        self.maxLevel = 30;
        self.speed = 100;
        
        // Skills go here!
        Fireball *fireball = [Fireball node];
        Iceblast *iceblast = [Iceblast node];
        Pyroblast *pyroblast = [Pyroblast node];
        FrostStorm *froststorm = [FrostStorm node];
        TsunamiBlast *tsunamiblast = [TsunamiBlast node];
        
        // Skins go here!
        NormalRambo *normalRambo = [NormalRambo node];
        
        
        // initializing all containers
        
        // All existing skins for this class
        NSMutableArray *skins = [[NSMutableArray alloc] initWithArray:@[normalRambo]];
        self.allSkins = skins;
        
        // All existing skills for this class
        NSMutableArray *skills = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast]];
        self.allSkills = skills;
        
        
        /** DEFAULT**/
        
        // --default skills for class-- skills currently equipped (5 max currently.)
        NSMutableArray *equippedSkills = [[NSMutableArray alloc] initWithArray:@[fireball, pyroblast, iceblast, froststorm, tsunamiblast]];
        self.equippedSkills = equippedSkills;
        
        // --default skills for class has to be in this array--
        NSMutableArray *skillsKnown = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast]];
        self.skillsKnown = skillsKnown;
        
        // --default skin for class--
        self.equippedSkin = normalRambo;
        
        // --default skin for class has to be in this array--
        NSMutableArray *skinsOwned = [[NSMutableArray alloc] initWithArray:@[normalRambo]];
        self.ownedSkins = skinsOwned;
        
    }
    
    return self;
}





@end
