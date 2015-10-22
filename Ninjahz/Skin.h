//
//  Skin.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCAnimation+Helper.h"


@interface Skin : CCNode {
    
}

@property(nonatomic,assign) NSString* image;

@property(nonatomic, strong)id backWalking;
@property(nonatomic, strong)id backIdle;


@property(nonatomic, strong)id frontWalking;
@property(nonatomic, strong)id frontIdle;

@property(nonatomic, strong)id leftWalking;
@property(nonatomic, strong)id rightWalking;


@end
