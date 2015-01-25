//
//  BackgroundGenerator.m
//  Henry & The Lantern of Fears
//
//  Created by Adriano Alves Ribeiro Gonçalves on 1/24/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import "BackgroundGenerator.h"

@interface BackgroundGenerator ()

@property double currentBackgroundX;
@property SKNode *backgroundLayer;

@end


@implementation BackgroundGenerator
+(id)generateWithBackground:(SKNode *)backgroundLayer
{
    
    BackgroundGenerator *generator = [BackgroundGenerator node];
    generator.currentBackgroundX = 0;
    generator.backgroundLayer = backgroundLayer;
    return generator;
    
}
-(void)populate
{
    
    for (int i = 0; i < 3; i++) {
        [self generate];
    }
    
    
}
-(void)generate
{
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
    //background.lightingBitMask = 0x1 << 31;
    background.size = self.scene.frame.size;
    background.position = CGPointMake(self.currentBackgroundX, 70);
    background.name = @"background";
    [self.backgroundLayer addChild:background];
    self.currentBackgroundX += background.frame.size.width;
    
}

@end
