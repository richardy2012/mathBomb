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



@property(strong,nonatomic)NSTimer *timer;

@property(strong,nonatomic)NSMutableArray *explosionImages;
@property int explosionCounter;

@end
