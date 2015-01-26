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

@implementation Menu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 1
        self.backgroundColor = [UIColor redColor];
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        label.text = @"Start";
        label.fontSize = 30;
        label.position = CGPointMake(100, 100);
        label.name = @"start";
        
        [self addChild:label];
        [self animateWithPulse:label];
        
        SKAction *disappear = [SKAction fadeAlphaTo:0.0 duration:0.3];
        SKAction *appear = [SKAction fadeAlphaTo:1.0 duration:0.3];
        SKAction *pulse = [SKAction sequence:@[disappear,appear]];
        [label runAction:[SKAction repeatActionForever:pulse]];
        
        
//        //2
//        NSString * message = @"You Won";
//        if (won) {
//            message = @"You Won!";
//        } else {
//            message = @"You Lose :[";
//        }
//        
//        // 3
//        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        label.text = message;
//        label.fontSize = 40;
//        label.fontColor = [SKColor blackColor];
//        label.position = CGPointMake(self.size.width/2, self.size.height/2);
//        [self addChild:label];
//        
//        // 4
//        [self runAction:
//         [SKAction sequence:@[
//                              [SKAction waitForDuration:3.0],
//                              [SKAction runBlock:^{
//             // 5
//             SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
//             SKScene * myScene = [[GameScene alloc] initWithSize:self.size];
//             [self.view presentScene:myScene transition: reveal];
//         }]
//                              ]]
//         ];
        
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        if([n.name isEqualToString:@"start"]){
            NSLog(@"entrou");
            
            GameScene *scene = [[GameScene alloc] initWithSize:self.view.bounds.size];
//            scene.size = skView.frame.size;
            scene.anchorPoint = CGPointMake(0.5, 0.5);
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

//- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    UITouch * touch = [touches ]
//    
//}



@end



