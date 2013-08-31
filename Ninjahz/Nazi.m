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
#import "WallJump.h"


@implementation Nazi

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
        WallJump *walljump = [WallJump node];
        Teleport *teleport = [Teleport node];
        
        
        // Skins go here!
        NormalNazi *normalNazi = [NormalNazi node];

        
        // initializing all containers
        
        // All existing skins for this class
        NSMutableArray *skins = [[NSMutableArray alloc] initWithArray:@[normalNazi]];
        self.allSkins = skins;
        
        // All existing skills for this class
        NSMutableArray *skills = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast, walljump, teleport]];
        self.allSkills = skills;
        
        
        /** DEFAULT**/

            // --default skills for class-- skills currently equipped (5 max currently.)
            NSMutableArray *equippedSkills = [[NSMutableArray alloc] initWithArray:@[fireball, walljump, teleport, froststorm, tsunamiblast]];
            self.equippedSkills = equippedSkills;
        
            
            
            // --default skills for class has to be in this array--
            NSMutableArray *skillsKnown = [[NSMutableArray alloc] initWithArray:@[fireball, iceblast, pyroblast, froststorm, tsunamiblast, walljump, teleport]];
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
