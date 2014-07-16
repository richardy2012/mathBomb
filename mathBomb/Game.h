//
//  Game.h
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/16/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property int level;
@property int score;

-(id)initWithLevel:(int)mLevel score:(int)mScore;


@end
