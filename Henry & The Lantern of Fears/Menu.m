//
//  Menu.m
//  Henry & The Lantern of Fears
//
//  Created by Bruno Baring on 1/26/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import "Menu.h"
#import "GameScene.h"
#import "GameViewController.h"
#import "Mundos.h"

@implementation Menu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
    
        self.backgroundColor = [UIColor redColor];
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        label.text = @"Start";
        label.fontSize = 30;
        label.position = CGPointMake(200,200);
        label.name = @"start";
        
        [self addChild:label];
        [self animateWithPulse: label];
        
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    for (UITouch *touch in touches) {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        if([n.name isEqualToString:@"start"]){
            NSLog(@"mundou pro mundo");

    NSLog(@"entrou1");
    for(UITouch *touch in touches)
      {
          SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
          NSLog(@"entrou2");
          if ([n.name isEqualToString:(@"start")])
        {
            
            NSLog(@"entrou3");
            

            
            Mundos *scene = [[Mundos alloc] initWithSize:self.view.bounds.size];
//            scene.size = skView.frame.size;
//            scene.anchorPoint = CGPointMake(0.5, 0.5);
            scene.scaleMode = SKSceneScaleModeAspectFill;
            
            // Present the scene.
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            [self.view presentScene:scene transition: reveal];

        }
    }
}
-(void)animateWithPulse:(SKNode *)node
{
    SKAction *disappear = [SKAction fadeAlphaTo:0.0 duration:0.3];
    SKAction *appear = [SKAction fadeAlphaTo:1.0 duration:0.3];
    SKAction *pulse = [SKAction sequence:@[disappear,appear]];
    [node runAction:[SKAction repeatActionForever:pulse]];
}
    
@end
