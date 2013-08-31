#import "HudLayer.h"
#import "Skill.h"
#import "Cache.h"


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
        CCMenuItem *skillItem;
        
        skillBar = [[NSMutableArray alloc] initWithCapacity:player.equippedSkills.count];

        for (Skill *skill in player.equippedSkills){
            skillItem = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                 selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
                                                         target:skill
                                                      selector:@selector(cast:)
                                                     ];
            
//           NSLog(@"%@", [[player.equippedSkills objectAtIndex:i] skillIcon]);
            [skillBar addObject:skillItem];
        }
        
//        Skill *skill;
//        
//        skill = [player.equippedSkills objectAtIndex:0];
//        CCMenuItemSprite *skillItem1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                              selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                                      target:skill
//                                                                     selector:@selector(cast:)
//                                                                 ];
//        skill = [player.equippedSkills objectAtIndex:1];
//        CCMenuItemSprite *skillItem2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                               selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                                       target:skill
//                                                                     selector:@selector(cast:)
//                                        ];
//        CCMenuItemSprite *skillItem3 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                               selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                                       target:skill
//                                                                     selector:@selector(cast:)
//                                        ];
//        CCMenuItemSprite *skillItem4 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                               selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                                       target:skill
//                                                                     selector:@selector(cast:)
//                                        ];
//        CCMenuItemSprite *skillItem5 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                               selectedSprite:[CCSprite spriteWithSpriteFrameName:skill.skillIcon]
//                                                                       target:skill
//                                                                     selector:@selector(cast:)
//                                        ];
//        

        CCMenu *Menu = [CCMenu menuWithArray:skillBar];
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
        

        controllingPlayer.targeting = YES;
//        NSLog(@"%i", _gameLayer.playerOne.attacking);
        _selected = TRUE;
    } else {
//        [_label setString:@"Skill 1 Disactivated"];
        controllingPlayer.targeting = NO;
        _selected = FALSE;
    }
    
}



-(void) addSkill:(Skill*)skill
{
   
}

@end
