//
//  GameplayLayer.h
//  SpaceViking
//
//  Created by Andrei Busuioc on 11/17/12.
//
//
#import <Foundation/Foundation.h>
#import "CCLayer.h"
#import "cocos2d.h"

#import "SneakyJoystick.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystickSkinnedBase.h"
@interface GameplayLayer : CCLayer
{
    CCSprite *vikingSprite;
    SneakyJoystick *leftJoystick;
    SneakyButton *jumpButton;
    SneakyButton *attackButton;
}

@end
