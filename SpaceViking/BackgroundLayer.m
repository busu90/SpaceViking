//
//  BackgroundLayer.m
//  SpaceViking
//
//  Created by Andrei Busuioc on 11/17/12.
//
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer


-(id)init
{
    self = [super init];
    if(self != nil)
    {
        CCSprite *backgroundImage;
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            backgroundImage = [CCSprite spriteWithFile:@"background.png"];
        }
        else
        {
            backgroundImage = [CCSprite spriteWithFile:@"backgroundiPhone.png"];
        }
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [backgroundImage setPosition:CGPointMake(screenSize.height/2, screenSize.width/2)];
        [self addChild:backgroundImage z:0 tag:0];
    }
    return self;
}

@end
