//
//  Mundos.m
//  Henry & The Lantern of Fears
//
//  Created by Bruno Baring on 1/26/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import "Mundos.h"
#import "GameScene.h"

@implementation Mundos
{
    SKLabelNode *_label1;
    SKLabelNode *_label2;
    SKLabelNode *_label3;
    SKLabelNode *_carregando;

}
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [UIColor redColor];
        
        _label1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        _label1.text = @"Mundos 1";
        _label1.fontSize = 30;
        _label1.position = CGPointMake(200,150);
        _label1.name = @"mundo1";
        [self addChild:_label1];
        
        _label2 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        _label2.text = @"Mundos 2";
        _label2.fontSize = 30;
        _label2.position = CGPointMake(200,200);
        _label2.name = @"mundo2";
        [self addChild:_label2];
        
        _label3 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        _label3.text = @"Mundos 3";
        _label3.fontSize = 30;
        _label3.position = CGPointMake(200,250);
        _label3.name = @"mundo3";
        [self addChild:_label3];
        
        [self animateWithPulse:_label1];
        [self animateWithPulse:_label2];
        [self animateWithPulse:_label3];
        
        SKLabelNode *carregandoLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        carregandoLabel.text = @"Carregando...";
        carregandoLabel.fontSize = 30;
        carregandoLabel.position = CGPointMake(200,150);
        carregandoLabel.name = @"carregando";
        
        SKAction *disappear = [SKAction fadeAlphaTo:0.0 duration:0.3];
        SKAction *appear = [SKAction fadeAlphaTo:1.0 duration:0.3];
        SKAction *pulse = [SKAction sequence:@[disappear,appear]];
        [_label1 runAction:[SKAction repeatActionForever:pulse]];
        [_label2 runAction:[SKAction repeatActionForever:pulse]];
        [_label3 runAction:[SKAction repeatActionForever:pulse]];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        if([n.name isEqualToString:@"mundo1"]){
            NSLog(@"entrou no jogo %@",n.name);
            
            _label1.hidden = YES;
            _label2.hidden = YES;
            _label3.hidden = YES;
            _carregando = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
            _carregando.text = @"Carregando...";
            _carregando.fontSize = 30;
            _carregando.position = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
            _carregando.name = @"carregando";
            
            [self addChild:_carregando];
        }

    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        if([n.name isEqualToString:@"mundo1"]){
            NSLog(@"entrou no jogo %@",n.name);
            
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

@end
