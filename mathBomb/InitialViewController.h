//
//  InitialViewController.h
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/23/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "Settings.h"

@interface InitialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *score;



@property (nonatomic,strong) Game *game;
@property (nonatomic,strong) Settings *settings;


@end
