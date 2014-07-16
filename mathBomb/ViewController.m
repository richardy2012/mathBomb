//
//  ViewController.m
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/15/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"
#define SIZE 250
#define DURATION 0.1f
#define YSEED 100
#define IMAGE_TOTAL 18

@interface ViewController ()


@end

@implementation ViewController

@synthesize timer;
@synthesize explosionCounter;
@synthesize explosionImages;
@synthesize question1,question2,mathOperator,answer1,answer2,answer3,answer4,progressBar;


#pragma mark - View Initialization
- (void)viewDidLoad
{
    [super viewDidLoad];

    // load images to be used in the explosion
    [self loadExplosionImages];
    
    // alpha zero to everyone
    [self hideControls];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Animate initial scene
    [self initialSceneAnimation];
    
}


#pragma mark - Working Methods
-(void) loadExplosionImages
{
    self.explosionImages=[[NSMutableArray alloc]init];
    
    for (int i=0; i<IMAGE_TOTAL; i++) {
        NSString *imageName;
        if (i<IMAGE_TOTAL-1) {
            imageName=[NSString stringWithFormat:@"boom%d",i];
        }else{
            imageName=@"boom99";
        }
        [self.explosionImages addObject:imageName];
    }
}

#pragma mark - Working Methods
-(void) hideControls
{
    self.question1.alpha=0;
    self.question2.alpha=0;
    self.mathOperator.alpha=0;
    self.answer1.alpha=0;
    self.answer2.alpha=0;
    self.answer3.alpha=0;
    self.answer4.alpha=0;
    self.progressBar.alpha=0;

}

-(void)initialSceneAnimation
{
    [UIView animateWithDuration:2.00f animations:^{
        self.question1.alpha=1;
        self.question2.alpha=1;
        self.mathOperator.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:5.50f animations:^{
            // create an initial explosion
            [self playExplosionSound];
            [self startExplosion];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.00f animations:^{
                self.answer1.alpha=1;
                self.answer2.alpha=1;
                self.answer3.alpha=1;
                self.answer4.alpha=1;

            } completion:^(BOOL finished) {
                NSLog(@"completion");
            }];

        }];
    }];
}




-(void)startExplosion
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:DURATION target:self selector:@selector(explosion) userInfo:nil repeats:YES];
}

-(void)explosion
{
    // remove frame
    for (UIView *view in self.view.subviews) {
        if (view.tag==999) {
            // remove explosion
            [view removeFromSuperview];
        }
    }
    if (explosionCounter>self.explosionImages.count) {
        [self.timer invalidate];
        return;
    }
    
    if (self.explosionCounter==self.explosionImages.count-1) {
        [self.timer invalidate];
        self.explosionCounter=0;
        return;
    }
    
    // add explosion frame
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width/2)-(SIZE/2), ((self.view.frame.size.height/2)-(SIZE/2))+YSEED, SIZE, SIZE)];
    imageView.image=[UIImage imageNamed:[self.explosionImages objectAtIndex:explosionCounter]];
    imageView.tag=999;
    [self.view addSubview:imageView];
    
    self.explosionCounter++;
    
}

#pragma mark - Sound Effects
-(void)playExplosionSound {
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundId);
    AudioServicesPlaySystemSound(soundId);
}


#pragma mark - Touch Events
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    self.timer=[NSTimer scheduledTimerWithTimeInterval:DURATION target:self selector:@selector(explosion) userInfo:nil repeats:YES];
}



#pragma mark - Status Bar
-(BOOL)prefersStatusBarHidden {
    return YES;
}


@end
