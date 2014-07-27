//
//  Settings.h
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/16/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

// General Settings
#define SIZE 250
#define DURATION 0.1f
#define YSEED -70
#define IMAGE_TOTAL 18

// Device Recognition
#define IS_IPAD_DEVICE                      UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

// Progress Timer
#define PROGRESS_TIMER_DURATION 0.05
#define PROGRESS_TIMER_BAR_SEED 0.005

// Gold Medal Ratio
#define GOLD_MEDAL_RATIO 35

// User Defaults
#define GAME_LEVEL @"gameLevel"
#define GAME_SCORE @"gameScore"


@interface Settings : NSObject


// Game properties
@property (nonatomic,strong) Game *game;


-(Game *)getGame;
-(void)updateGameWithScore:(int)score;
-(void)updateGameWithLevel:(int)level;
-(void)updateGameWithObject:(Game *)game;

@end
