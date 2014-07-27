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
#import "Medals.h"

@interface InitialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIImageView *medal1;
@property (weak, nonatomic) IBOutlet UIImageView *medal2;
@property (weak, nonatomic) IBOutlet UIImageView *medal3;
@property (weak, nonatomic) IBOutlet UIImageView *medal4;
@property (weak, nonatomic) IBOutlet UIImageView *medal5;



@property (nonatomic,strong) Game *game;
@property (nonatomic,strong) Settings *settings;
@property (nonatomic,strong) Medals *medals;


@end
