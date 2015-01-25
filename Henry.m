//
//  Henry.m
//  Henry & The Lantern of Fears
//
//  Created by Adriano Alves Ribeiro Gonçalves on 1/22/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import "Henry.h"

@implementation Henry

+(id)henry
{
    
    Henry *henry = [Henry spriteNodeWithImageNamed:@"henrymenine"];
    henry.size = CGSizeMake(39, 60);
//    SKSpriteNode *leftEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
//    leftEye.position = CGPointMake(-3, 8);
//    [henry addChild:leftEye];
//    
//    SKSpriteNode *rightEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
//    rightEye.position = CGPointMake(13, 8);
//    [henry addChild:rightEye];
    
    SKSpriteNode *lightBlocker = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(1,40)];
    lightBlocker.zPosition = -3;
    lightBlocker.position = CGPointMake(henry.frame.size.width * 1.5, henry.position.y);
    lightBlocker.shadowCastBitMask = 0x1 << 30;
    [henry addChild:lightBlocker];
    
//    SKSpriteNode *lightBlocker2 = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(40,40)];
//    lightBlocker2.position = CGPointMake(40, -henry.frame.size.height);
//    lightBlocker2.shadowCastBitMask = 0x1 << 30;
//    [henry addChild:lightBlocker2];
//
//    SKSpriteNode *lightBlocker3 = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(40,40)];
//    lightBlocker3.position = CGPointMake(40, henry.frame.size.height *2);
//    lightBlocker3.shadowCastBitMask = 0x1 << 31;
//    [henry addChild:lightBlocker3];
    
    henry.name = @"henry";
    
    henry.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:henry.size];
    henry.physicsBody.restitution = 0.0;
    henry.physicsBody.allowsRotation  = NO;
    henry.shadowCastBitMask = 0x1 << 31;
    
    
    return henry;
}
-(void)walkRight
{
    
    SKAction *incrementRight = [SKAction repeatActionForever:[SKAction moveByX:30 y:0 duration:0.3]];
    
    [self runAction:incrementRight withKey:@"walkRight"];
}
-(void)walkLeft
{
    
    SKAction *incrementLeft = [SKAction repeatActionForever:[SKAction moveByX:-30 y:0 duration:0.3]];
    
    [self runAction:incrementLeft withKey:@"walkLeft"];
}
-(void)jump
{
    
    [self.physicsBody applyImpulse:CGVectorMake(0, 40)];
    
    
}
-(void)pickLantern
{
    
    NSString *lanternLightEmmiterPath = [[NSBundle mainBundle] pathForResource:@"lanternLight" ofType:@"sks"];
    SKEmitterNode *lanternLightEmmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:lanternLightEmmiterPath];
    
    
    lanternLightEmmitter.position = CGPointMake(self.frame.size.width,0);
    
    lanternLightEmmitter.name = @"lanternLightParticle";
    
    SKLightNode *lanternLight = [[SKLightNode alloc] init];
    lanternLight.categoryBitMask = 0x1 << 31;
    lanternLight.falloff = 0.1;
    lanternLight.ambientColor = [UIColor whiteColor];
    lanternLight.lightColor = lanternLightEmmitter.particleColor;
    lanternLight.shadowColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    lanternLight.name = @"lanternLight";
    
    [lanternLightEmmitter addChild:lanternLight];
    [self addChild:lanternLightEmmitter];
    
    
    SKLightNode *fakeLanternLight = [[SKLightNode alloc] init];
    fakeLanternLight.categoryBitMask = 0x1 << 30;
    fakeLanternLight.falloff = 0.1;
    fakeLanternLight.ambientColor = [UIColor whiteColor];
    fakeLanternLight.lightColor = lanternLightEmmitter.particleColor;
    fakeLanternLight.shadowColor = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.3];
    fakeLanternLight.name = @"fakeLanternLight";
    
    
    fakeLanternLight.position = CGPointMake(-self.frame.size.width,0);
    
    
    
    [self addChild:fakeLanternLight];
    
}


@end
