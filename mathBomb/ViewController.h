//
//  ViewController.h
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/15/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import<AVFoundation/AVFoundation.h>
#import "Game.h"
#import "Settings.h"
#import "Medals.h"

@interface ViewController : UIViewController
{
    SystemSoundID soundId;
}

@property (weak, nonatomic) IBOutlet UILabel *question1;
@property (weak, nonatomic) IBOutlet UILabel *question2;
@property (weak, nonatomic) IBOutlet UILabel *mathOperator;
@property (weak, nonatomic) IBOutlet UIButton *answer1;
@property (weak, nonatomic) IBOutlet UIButton *answer2;
@property (weak, nonatomic) IBOutlet UIButton *answer3;
@property (weak, nonatomic) IBOutlet UIButton *answer4;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *separator;

@property (weak, nonatomic) IBOutlet UIImageView *medal1;
@property (weak, nonatomic) IBOutlet UIImageView *medal2;
@property (weak, nonatomic) IBOutlet UIImageView *medal3;
@property (weak, nonatomic) IBOutlet UIImageView *medal4;
@property (weak, nonatomic) IBOutlet UIImageView *medal5;


// Level of the game (starting from 1)
@property int gameLevel;

@property(strong,nonatomic)NSTimer *timer;
@property(strong,nonatomic)NSTimer  *progressTimer;

@property(strong,nonatomic)NSMutableArray *explosionImages;
@property int explosionCounter;

// Game Properties
@property (nonatomic,strong) Game *game;

// Settings
@property (nonatomic,strong) Settings *settings;

// Gold Medals
@property (nonatomic,strong) Medals *medals;

// Correct button's position
@property int correctPosition;

// Answers to be shown & unique
@property (nonatomic,strong) NSMutableArray *answers;


@end
