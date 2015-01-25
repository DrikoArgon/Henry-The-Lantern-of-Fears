//
//  BackgroundGenerator.h
//  Henry & The Lantern of Fears
//
//  Created by Adriano Alves Ribeiro Gonçalves on 1/24/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BackgroundGenerator : SKNode
+(id)generateWithBackground:(SKNode *)backgroundLayer;
-(void)generate;
-(void)populate;
@end
