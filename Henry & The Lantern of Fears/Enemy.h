//
//  Enemy.h
//  Henry & The Lantern of Fears
//
//  Created by Adriano Alves Ribeiro Gonçalves on 1/23/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Enemy : SKSpriteNode
@property (strong, nonatomic) NSString *imageName;
@property (nonatomic) int life;
@property (nonatomic) int score;


@end
