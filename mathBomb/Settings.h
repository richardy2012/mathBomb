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
#define IS_IPAD_DEVICE                      UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad



@interface Settings : NSObject


// Game properties
@property (nonatomic,strong) Game *game;


-(Game *)getGame;
-(void)updateGameWithScore:(int)score;
-(void)updateGameWithLevel:(int)level;
-(void)updateGameWithObject:(Game *)game;

@end
