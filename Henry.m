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
    
    Henry *henry = [Henry spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(40, 40)];
    SKSpriteNode *leftEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    leftEye.position = CGPointMake(-3, 8);
    [henry addChild:leftEye];
    
    SKSpriteNode *rightEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    rightEye.position = CGPointMake(13, 8);
    [henry addChild:rightEye];
    
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
-(void)pickLantern:(SKNode *)world isFlipped:(BOOL)flipped
{
    
    NSString *lanternLightEmmiterPath = [[NSBundle mainBundle] pathForResource:@"lanternLight" ofType:@"sks"];
    SKEmitterNode *lanternLightEmmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:lanternLightEmmiterPath];
    
    if(!flipped){
    
    lanternLightEmmitter.position = CGPointMake(self.position.x + self.frame.size.width,
                                                self.position.y);
    }
    else{
        lanternLightEmmitter.position = CGPointMake(self.position.x - self.frame.size.width,
                                                    self.position.y);
        
    }
    lanternLightEmmitter.name = @"lanternLightParticle";
    
    SKLightNode *lanternLight = [[SKLightNode alloc] init];
    lanternLight.categoryBitMask = 0x1 << 31;
    lanternLight.falloff = 0.1;
    lanternLight.ambientColor = [UIColor whiteColor];
    lanternLight.lightColor = lanternLightEmmitter.particleColor;
    lanternLight.shadowColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    lanternLight.name = @"lanternLight";
    
    [lanternLightEmmitter addChild:lanternLight];
    [world addChild:lanternLightEmmitter];
}


@end
