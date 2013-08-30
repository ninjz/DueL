//
//  Cache.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-29.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Player;
@interface Cache : CCNode {
    
}

@property (nonatomic, strong) CCArray *bullets;

-(void) setOwner:(Player *)owner;

@end
