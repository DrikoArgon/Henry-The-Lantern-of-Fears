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
-(void)start
{
    
    SKAction *moveRight = [SKAction repeatActionForever:[SKAction moveByX:1 y:0 duration:0.10]];
    [self runAction:moveRight];
    
    
}


@end
