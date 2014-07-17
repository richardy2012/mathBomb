//
//  Settings.m
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/16/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Settings.h"

// User Defaults
#define GAME_LEVEL @"gameLevel"
#define GAME_SCORE @"gameScore"


@implementation Settings

@synthesize game;


#pragma mark - Game Methods
-(Game *)getGame {
    
    self.game=[[Game alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *gameLevel=[defaults objectForKey:GAME_LEVEL];
    NSString *gameScore=[defaults objectForKey:GAME_SCORE];
    
    // Check if there are data
    if (gameLevel.length>0 && gameScore.length>0) {
        self.game=[[Game alloc]init];
        self.game.level=[gameLevel intValue];
        self.game.score=[gameScore intValue];
    } else {
        // Create User Defaults Object
        self.game=[[Game alloc]initWithLevel:1 score:0];
        // Store Object
        [self addGameWithObject:self.game];
    }
    
    return self.game;
}

-(void)addGameWithObject:(Game *)objGame
{
    self.game=[[Game alloc]init];
    self.game=objGame;
    
    NSString *gameLevel=[NSString stringWithFormat:@"%d",self.game.level];
    NSString *gameScore=[NSString stringWithFormat:@"%d",self.game.score];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:gameLevel forKey:GAME_LEVEL];
    [defaults setObject:gameScore forKey:GAME_SCORE];
    [defaults synchronize];
 
}

-(void)updateGameWithScore:(int)score
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%d",score] forKeyPath:GAME_SCORE];
    [defaults synchronize];
}
-(void)updateGameWithLevel:(int)level
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%d",level] forKeyPath:GAME_LEVEL];
    [defaults synchronize];
    
}
-(void)updateGameWithObject:(Game *)game
{
    self.game=[[Game alloc]init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%d",self.game.level] forKeyPath:GAME_LEVEL];
    [defaults setValue:[NSString stringWithFormat:@"%d",self.game.score] forKeyPath:GAME_SCORE];
    [defaults synchronize];
}

@end
