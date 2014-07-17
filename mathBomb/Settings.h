//
//  Settings.h
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/16/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface Settings : NSObject


// Game properties
@property (nonatomic,strong) Game *game;


-(Game *)getGame;
-(void)updateGameWithScore:(int)score;
-(void)updateGameWithLevel:(int)level;
-(void)updateGameWithObject:(Game *)game;

@end
