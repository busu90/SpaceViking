//
//  GameScene.m
//  SpaceViking
//
//  Created by Andrei Busuioc on 11/17/12.
//
//

#import "GameScene.h"

@implementation GameScene

-(id)init
{
    self = [super init];
    if(self != nil)
    {
        BackgroundLayer *backgrounLayer = [BackgroundLayer node];
        [self addChild:backgrounLayer z:0];
        GameplayLayer *gameplayLayer = [GameplayLayer node];
        [self addChild:gameplayLayer z:5];
    }
    return self;
}

@end
