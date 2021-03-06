//
//  GameplayLayer.m
//  SpaceViking
//
//  Created by Andrei Busuioc on 11/17/12.
//
//

#import "GameplayLayer.h"

@implementation GameplayLayer

-(id)initJoystickAndButtons
{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    CGRect joystickBaseDimensions = CGRectMake(0, 0, 128.0f, 128.0f);
    CGRect jumpButtonDimensions = CGRectMake(0, 0, 64.0f, 64.0f);
    CGRect attackButtonDimensions = CGRectMake(0, 0, 64.0f, 64.0f);
    CGPoint joystickBasePosition;
    CGPoint jumpButtonPosition;
    CGPoint attackButtonPosition;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        CCLOG(@"Positioning joystick and button for pad");
        joystickBasePosition = ccp(screenSize.height*0.0625f, screenSize.width*0.052f);
        jumpButtonPosition = ccp(screenSize.height*0.0946f, screenSize.width*0.052f);
        attackButtonPosition = ccp(screenSize.height*0.0947f, screenSize.width*0.052f);
    }
    else
    {
        CCLOG(@"Positioning joystick and button for phone");
        joystickBasePosition = ccp(screenSize.height*0.07f,screenSize.width*0.11f);
        jumpButtonPosition = ccp(screenSize.height*0.93f,screenSize.width*0.11f);
        attackButtonPosition = ccp(screenSize.height*0.93f,screenSize.width*0.35f);
    }
    SneakyJoystickSkinnedBase *joystickBase = [[[SneakyJoystickSkinnedBase alloc] init] autorelease];
    joystickBase.position = joystickBasePosition;
    joystickBase.backgroundSprite = [CCSprite spriteWithFile:@"dpadDown.png"]; 
    joystickBase.thumbSprite = [CCSprite spriteWithFile:@"joystickDown.png"]; 
    joystickBase.joystick = [[SneakyJoystick alloc] initWithRect:joystickBaseDimensions];
    
    leftJoystick = [joystickBase.joystick retain]; 
    [self addChild:joystickBase]; 
    SneakyButtonSkinnedBase *jumpButtonBase = [[[SneakyButtonSkinnedBase alloc] init] autorelease]; 
    jumpButtonBase.position = jumpButtonPosition; 
    jumpButtonBase.defaultSprite = [CCSprite spriteWithFile:@"jumpUp.png"]; 
    jumpButtonBase.activatedSprite = [CCSprite spriteWithFile:@"jumpDown.png"]; 
    jumpButtonBase.pressSprite = [CCSprite spriteWithFile:@"jumpDown.png"]; 
    jumpButtonBase.button = [[SneakyButton alloc] initWithRect:jumpButtonDimensions]; 
    jumpButton = [jumpButtonBase.button retain]; 
    jumpButton.isToggleable = NO; 
    [self addChild:jumpButtonBase]; 
    SneakyButtonSkinnedBase *attackButtonBase = [[[SneakyButtonSkinnedBase alloc] init] autorelease];
    attackButtonBase.position = attackButtonPosition; 
    attackButtonBase.defaultSprite = [CCSprite spriteWithFile:@"handUp.png"]; 
    attackButtonBase.activatedSprite = [CCSprite spriteWithFile:@"handDown.png"];
    attackButtonBase.pressSprite = [CCSprite spriteWithFile:@"handDown.png"]; 
    attackButtonBase.button = [[SneakyButton alloc] initWithRect:attackButtonDimensions]; 
    attackButton = [attackButtonBase.button retain]; 
    attackButton.isToggleable = NO; 
    [self addChild:attackButtonBase];
    
    
}

-(void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)tempNode forTimeDelta:(float)deltaTime
{
    CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 1024.0f); 
    CGPoint newPosition = ccp(tempNode.position.x + scaledVelocity.x * deltaTime, tempNode.position.y + scaledVelocity.y *deltaTime); 
    [tempNode setPosition:newPosition]; 
    if (jumpButton.active == YES) {
        CCLOG(@"Jump button is pressed."); 
    }
    if (attackButton.active == YES) {
        CCLOG(@"Attack button is pressed."); 
    }
}

#pragma mark -
#pragma mark Update Method
-(void) update:(ccTime)deltaTime
{
    [self applyJoystick:leftJoystick toNode:vikingSprite forTimeDelta:deltaTime];
}

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
        [self initJoystickAndButtons];
        [self scheduleUpdate];
        if(UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
        {
            [vikingSprite setScaleX:screenSize.height/1024.0f];
            [vikingSprite setScaleY:screenSize.width/768.0f];
        }
    }
    return self;
}

@end
