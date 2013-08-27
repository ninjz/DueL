#import "HudLayer.h"
#import "Skill.h"


@implementation HudLayer

-(id)initWithPlayer:(CharacterClass*)player
{
    if(self = [super init])
    {
        // communication between the HUD and game Layer.
        _gameLayer = [GameLayer sharedGameLayer];
        
        
        // label for debugging
        _label = [CCLabelTTF labelWithString:@"Idle" fontName:@"Arial" fontSize:32.0];
        _label.position = ccp(SCREEN.width/2,
                              SCREEN.height-(_label.contentSize.height/2)-60);
        [self addChild:_label];
        
        // Player controlling this Interface
        controllingPlayer = player;
        

        // skill icon bar
        Skill *skill;
        skill = [player.equippedSkills objectAtIndex:0];
        
        NSLog(@"Player 1 : %@", [player name]);
        
        
        
        CCMenuItem *skill1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                    selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                            target:self
                                                           selector:@selector(skill1Pressed:)];
        
        skill = [player.equippedSkills objectAtIndex:1];
        CCMenuItem *skill2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                             target:self
                                                           selector:@selector(skill2Pressed:)];
        
        skill = [player.equippedSkills objectAtIndex:2];
        CCMenuItem *skill3 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                             target:self
                                                           selector:@selector(skill3Pressed:)];
        
        skill = [player.equippedSkills objectAtIndex:3];
        CCMenuItem *skill4 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                             target:self
                                                           selector:@selector(skill4Pressed:)];
        
        skill = [player.equippedSkills objectAtIndex:4];
        CCMenuItem *skill5 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                             target:self
                                                           selector:@selector(skill5Pressed:)];
        
        CCMenu *Menu = [CCMenu menuWithItems:skill1, skill2, skill3, skill4, skill5, nil];
        Menu.anchorPoint = ccp(0,0);
        Menu.position=ccp(160,30);
        Menu.scale = 2;
        [Menu alignItemsHorizontallyWithPadding:0.0f];
        [self addChild:Menu];
        
    }
    return self;
}


- (void)skill1Pressed:(id)sender {
    [_label setString:@"Skill 1 Activated"];
//    [controllingPlayer useSkill1];
}


- (void)skill2Pressed:(id)sender {
    [_label setString:@"Skill 2 Activated"];
}

- (void)skill3Pressed:(id)sender {
    [_label setString:@"Skill 3 Activated"];
}

- (void)skill4Pressed:(id)sender {
    [_label setString:@"Skill 4 Activated"];
}

- (void)skill5Pressed:(id)sender {
    [_label setString:@"Skill 5 Activated"];
}

-(void) addSkill:(Skill*)skill
{
    
}

@end
