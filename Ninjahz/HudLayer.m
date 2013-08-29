#import "HudLayer.h"
#import "Skill.h"


@implementation HudLayer

-(id)initWithPlayer:(Player*)player
{
    if(self = [super init])
    {
        // communication between the HUD and game Layer.
        _gameLayer = [GameLayer sharedGameLayer];
        
        
        // label for debugging
        _label = [CCLabelTTF labelWithString:@"Idle" fontName:@"Arial" fontSize:32.0];
        _label.position = ccp(SCREEN.width/2,
                              SCREEN.height-(_label.contentSize.height/2)-60);
//        [self addChild:_label];
        
        // Player controlling this Interface
        controllingPlayer = player;
        
        // Health Bar
        int currHp = controllingPlayer.currHp;
        _healthBar = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", currHp]           fontName:@"Arial" fontSize:20.0];
        _healthBar.position = ccp(30,
                                  100);
        [self addChild:_healthBar];
        
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
        
        _selected = FALSE;
        
    }
    return self;
}


-(void)updateHealthBar
{
    int currHp = controllingPlayer.currHp;
    [_healthBar setString:[NSString stringWithFormat:@"%i", currHp]];
}



// Send message back to controllingPlayer to use that skill
- (void)skill1Pressed:(id)sender {
    if(!_selected){
//        [_label setString:@"Skill 1 Activated"];
        _interface.selectedSkill = 1;
        

        controllingPlayer.attacking = YES;
//        NSLog(@"%i", _gameLayer.playerOne.attacking);
        _selected = TRUE;
    } else {
//        [_label setString:@"Skill 1 Disactivated"];
        controllingPlayer.attacking = NO;
        _selected = FALSE;
    }
    
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
