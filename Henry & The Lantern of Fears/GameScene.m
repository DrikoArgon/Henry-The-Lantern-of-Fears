//
//  GameScene.m
//  Henry & The Lantern of Fears
//
//  Created by Adriano Alves Ribeiro Gonçalves on 1/22/15.
//  Copyright (c) 2015 ABHI. All rights reserved.
//

#import "GameScene.h"
#import "Henry.h"

@interface GameScene ()

@property BOOL isStarted;
@property BOOL isGameOver;

@end

@implementation GameScene{
    
    SKNode *_world;
    SKNode *_HUD;
    Henry *_henry;
    BOOL _rightButtonPressed;
    BOOL _leftButtonPressed;
    BOOL _jumping;
    
    
}

static const uint32_t GROUND_CATEGORY = 0x1;
static const uint32_t PLAYER_CATEGORY = 0x1 << 1;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    //Defining Inicial Values
    
    
    
    //Setting Delegate
    self.physicsWorld.contactDelegate = self;
   
    //Creating World ( Holds the player, the ground, the enemies, etc )
    _world = [SKNode node];
    [self addChild:_world];
    
    //Creating HUD ( Holds the user interface )
    _HUD = [SKNode node];
    
    [self addChild:_HUD];
    
    //Inserting Ground
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(self.frame.size.width, 100)];
    ground.position = CGPointMake(100, -self.frame.size.height * 0.5 + ground.frame.size.height * 0.5);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    ground.physicsBody.categoryBitMask = GROUND_CATEGORY;
    [_world addChild:ground];
    
    SKSpriteNode *ground2 = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(self.frame.size.width, 100)];
    ground2.position = CGPointMake(ground2.frame.size.width, -self.frame.size.height * 0.5 + ground2.frame.size.height * 0.5);
    ground2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground2.size];
    ground2.physicsBody.dynamic = NO;
    ground2.physicsBody.categoryBitMask = GROUND_CATEGORY;
    [_world addChild:ground2];
    
    //Inserting Player
    _henry = [Henry henry];
    _henry.physicsBody.categoryBitMask = PLAYER_CATEGORY;
    _henry.physicsBody.collisionBitMask = GROUND_CATEGORY;
    _henry.physicsBody.contactTestBitMask = GROUND_CATEGORY;
    [_world addChild:_henry];
    
    //Inserting Hud Controls
    
    //Buttons
    SKSpriteNode *rightButton = [SKSpriteNode spriteNodeWithImageNamed:@"rightButton"];
    rightButton.size = CGSizeMake(60, 60);
    rightButton.name = @"rightButton";
    rightButton.position = CGPointMake(-self.frame.size.width * 0.5 +rightButton.frame.size.width * 0.5 + rightButton.frame.size.width + 5,
                                       -self.frame.size.height * 0.5 + rightButton.frame.size.height * 0.5);
    
    [_HUD addChild:rightButton];
    
    SKSpriteNode *leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"leftButton"];
    leftButton.size = CGSizeMake(60, 60);
    leftButton.name = @"leftButton";
    leftButton.position = CGPointMake(-self.frame.size.width * 0.5 +leftButton.frame.size.width * 0.5,
                                       -self.frame.size.height * 0.5 + leftButton.frame.size.height * 0.5);
    
    [_HUD addChild:leftButton];
    
    SKSpriteNode *jumpButton = [SKSpriteNode spriteNodeWithImageNamed:@"jumpButton"];
    jumpButton.size = CGSizeMake(60, 60);
    jumpButton.name = @"jumpButton";
    jumpButton.position = CGPointMake(self.frame.size.width * 0.5 - jumpButton.frame.size.width * 0.5,
                                      -self.frame.size.height * 0.5 + jumpButton.frame.size.height * 0.5 + jumpButton.frame.size.height);
    
    [_HUD addChild:jumpButton];
    
    // Inserting Life and Score
    SKSpriteNode *life = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(40, 40)];
    SKSpriteNode *leftEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    leftEye.position = CGPointMake(-3, 8);
    [life addChild:leftEye];
    
    SKSpriteNode *rightEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    rightEye.position = CGPointMake(13, 8);
    [life addChild:rightEye];
    
    [life setScale:0.5];
    life.position = CGPointMake(-self.frame.size.width * 0.5 + life.frame.size.width * 0.5 + 10, self.frame.size.height * 0.5 - life.frame.size.height * 0.5 - 10);
    
    [_HUD addChild:life];
    
    SKSpriteNode *xSeparator = [SKSpriteNode spriteNodeWithImageNamed:@"x"];
    xSeparator.size = life.size;
    xSeparator.position = CGPointMake(life.position.x + life.frame.size.width * 0.5 + xSeparator.frame.size.width * 0.5, life.position.y - 5 );
    
    [xSeparator setScale:0.5];
    [_HUD addChild:xSeparator];
    
    _lifeLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Alternate"];
    _lifeLabel.fontColor = [UIColor blackColor];
    _lifeLabel.fontSize = 25;
    
    _lifeLabel.position = CGPointMake(xSeparator.position.x + 15 , xSeparator.position.y - 5);
    
    [_HUD addChild:_lifeLabel];
    
    self.numberOfLives = 3;
}

-(void)setNumberOfLives:(int)numberOfLives
{
    
    _numberOfLives = numberOfLives;
    _lifeLabel.text = [NSString stringWithFormat:@"%d",numberOfLives];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        SKNode *n = [_HUD nodeAtPoint:[touch locationInNode:_HUD]];
        
        if([n.name isEqualToString:@"rightButton"]){
            
            _rightButtonPressed = YES;
            
            if(_henry.xScale == -1){
                _henry.xScale = 1;
            }
            [_henry walkRight];
        }
        else if([n.name isEqualToString:@"leftButton"]){
            
            _leftButtonPressed = YES;
            
            if(_henry.xScale == 1){
                _henry.xScale = -1;
            }
            [_henry walkLeft];
        }
        else if([n.name isEqualToString:@"jumpButton"]){

            if(!_jumping){
                _jumping = YES;
                [_henry jump];
            }
        }
        
    }
    
}

-(void)start
{
    self.isStarted = YES;
    
    
    [_henry start];

    
}

-(void)clear
{
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_rightButtonPressed) {
        _rightButtonPressed = NO;
        [_henry removeActionForKey:@"walkRight"];
    }
    if (_leftButtonPressed) {
        _leftButtonPressed = NO;
        [_henry removeActionForKey:@"walkLeft"];
    }
    
}
-(void)gameOver
{
    _isGameOver = YES;
    self.numberOfLives--;
    
    
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    

    SKPhysicsBody *firstBody;
    SKPhysicsBody *secondBody;
    
    if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask )
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
        
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if(firstBody.categoryBitMask == GROUND_CATEGORY && secondBody.categoryBitMask == PLAYER_CATEGORY)
    {
        _jumping = NO;
    }
    
}


-(void)didSimulatePhysics
{
    if(!_isGameOver){
    [self centerOnNode:_henry];
    }
    
    [_world enumerateChildNodesWithName:@"henry" usingBlock:^(SKNode *node, BOOL *stop) {
        if(node.position.y + node.frame.size.height < (-self.frame.size.height * 0.5))
        {
            
            [node removeFromParent];
            [self gameOver];
        }
    }];
    
}
-(void)centerOnNode:(SKNode *)node
{
    
    CGPoint positionInScene = [self convertPoint:node.position fromNode:node.parent];
    positionInScene.x += 200;
    _world.position = CGPointMake(_world.position.x - positionInScene.x, _world.position.y);
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
