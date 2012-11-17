//
//  GameplayLayer.m
//  SpaceViking
//
//  Created by Andrei Busuioc on 11/17/12.
//
//

#import "GameplayLayer.h"

@implementation GameplayLayer

-(id)init
{
    self = [super init];
    if(self != nil)
    {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        self.isTouchEnabled = YES;
        vikingSprite = [CCSprite spriteWithFile:@"sv_anim_1.png"];
        [vikingSprite setPosition:CGPointMake(screenSize.height/2, screenSize.width*0.17f)];
        [self addChild:vikingSprite];
        if(UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
        {
            [vikingSprite setScaleX:screenSize.height/1024.0f];
            [vikingSprite setScaleY:screenSize.width/768.0f];
        }
    }
    return self;
}

@end
