//
//  Nazi.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-25.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Nazi.h"
#import "CCAnimation+Helper.h"
#import "Fireball.h"
#import "Iceblast.h"
#import "Pyroblast.h"
#import "FrostStorm.h"
#import "TsunamiBlast.h"

@implementation Nazi

-(id) init{
    if (self = [super initWithSpriteFrameName:@"nazi_back1.png"]){
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
        CCAnimation *nazi = [CCAnimation animationWithFrame:@"nazi_back"
                                                 frameCount:6
                                                      delay:0.2f];

        
        // initializing all containers
        
        // All existing skins for this class
        NSMutableArray *skins = [[NSMutableArray alloc] initWithArray:@[nazi]];
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
            self.equippedSkin = nazi;
            
            // --default skin for class has to be in this array--
            NSMutableArray *skinsOwned = [[NSMutableArray alloc] initWithArray:@[nazi]];
            self.ownedSkins = skinsOwned;

    }
    
    return self;
}






@end
