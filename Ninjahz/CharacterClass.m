//
//  CharacterClass.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-25.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CharacterClass.h"


@implementation CharacterClass

-(void) setPosition:(CGPoint)position
{
    if(_mainPlayer){
        if(position.y > SCREEN.height/2){
            
        } else if(position.y < 90){
            
        } else if(position.x < 20 && position.y < 10){
            
        } else if(position.x > SCREEN.width - 20  && position.y < 10 ){
            
        }
        else {
            [super setPosition:position];
            
        }
    } else {
        if(position.y < SCREEN.height/2 + 30){
            
        } else if(position.y > SCREEN.height - 90){
            
        } else if(position.x < 20 && position.y > SCREEN.height - 10){
            
        } else if(position.x > SCREEN.width - 20  && position.y > SCREEN.height - 10 ){
            
        }
        else {
            [super setPosition:position];
            
        }
        
        
    }
    
}


-(void) addSkill:(Skill*)skill
{
    [self.skillsKnown addObject:skill];
}

-(void) equipSkill:(Skill*)skill
{
    [self.equippedSkills addObject:skill];
}

-(void) unequipSkill:(Skill*)skill
{
    [self.equippedSkills removeObject:skill];
}




-(void) addSkin:(CCAnimation*)skin
{
    [self.ownedSkins addObject:skin];
}


-(void) equipSkin:(CCAnimation*)skin
{
    self.equippedSkin = skin;
}

//-(void) unequipSkin


@end
