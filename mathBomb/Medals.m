//
//  Medals.m
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/27/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Medals.h"


@implementation Medals


-(int)medalsWithScore:(int)score {
    return score/GOLD_MEDAL_RATIO;
}

@end
