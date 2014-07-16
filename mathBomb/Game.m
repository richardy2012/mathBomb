//
//  Game.m
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/16/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize level,score;

-(id)initWithLevel:(int)mLevel score:(int)mScore {
    self=[super init];
    if (self) {
        level=mLevel;
        score=mScore;
    }
    return self;
}


@end
