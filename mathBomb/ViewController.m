//
//  ViewController.m
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/15/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize timer,progressTimer;
@synthesize explosionCounter;
@synthesize explosionImages;
@synthesize question1,question2,mathOperator,answer1,answer2,answer3,answer4,progressBar,separator;
@synthesize answers;
@synthesize gameLevel;
@synthesize game,settings;
@synthesize correctPosition;


#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // load images to be used in the explosion
    [self loadExplosionImages];

    // Get game settings
    self.settings=[[Settings alloc]init];
    self.game=[self.settings getGame];

    // hide all controls
    [self hideControls];
    
    // Unique answers
    self.answers=[[NSMutableArray alloc]init];
  
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
    
    [self initializeUIControls];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // disable progress timer
    [self.progressTimer invalidate];

}

-(void)initializeUIControls {
    
    // Generate random numbers
    [self generateRandomValues];
    
    // Show controls
    [self showControls];
    
    // Start up progress timer
    [self startProgressTimer];

}


#pragma mark - UI Actions
- (IBAction)close:(id)sender {
    [self closeView];
}

- (IBAction)answer1Selected:(id)sender {
    [self processAnswer:0];
}

- (IBAction)answer2Selected:(id)sender {
    [self processAnswer:1];
}

- (IBAction)answer3Selected:(id)sender {
    [self processAnswer:2];
}

- (IBAction)answer4Selected:(id)sender {
    [self processAnswer:3];
}




#pragma mark - Working Methods
-(void)closeView {
    [self.progressTimer invalidate];
    [self.navigationController popViewControllerAnimated:YES];
}
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
    self.separator.alpha=0;

}

-(void) showControls
{
    self.question1.alpha=1;
    self.question2.alpha=1;
    self.mathOperator.alpha=1;
    self.answer1.alpha=1;
    self.answer2.alpha=1;
    self.answer3.alpha=1;
    self.answer4.alpha=1;
    self.progressBar.alpha=1;
    self.separator.alpha=1;
    
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

-(void)processAnswer:(int)answer {
    if (answer==self.correctPosition) {
        // play correct sound
        [self playCorrectAnswerSound];
        // disable progress timer
        [self.progressTimer invalidate];
        self.progressBar.progress=0;
        // update score
        [self.settings updateGameWithScore:self.game.score+1];
        //
        [self.progressTimer invalidate];
        [self initializeUIControls];
    } else {
        [self progressTimerTimeOut];
    }
}

-(int)fakeNumberWithResult:(int)result {
    BOOL unique=NO;
    int random=0;
    
    while (!unique) {
        if (result<=9) {
            random=arc4random() % 10;
        } else if (random<=99) {
            random=arc4random() % 99;
        } else if (random<=999) {
            random=arc4random() % 999;
        } else if (random<=9999) {
            random=arc4random() % 9999;
        }
        int count=0;
        // test if it is unique
        for (NSString *answer in self.answers) {
            if (random==[answer intValue]) {
                count++;
            }
        }
        if (count==0) {
            unique=YES;
        }
    }
    [self.answers addObject:[NSString stringWithFormat:@"%d",random]];
    return random;
}

#pragma mark - Explosion Methods
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
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    // add explosion frame
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width/2)-(SIZE/2), ((self.view.frame.size.height/2)-(SIZE/2))+YSEED, SIZE, SIZE)];
    imageView.image=[UIImage imageNamed:[self.explosionImages objectAtIndex:explosionCounter]];
    imageView.tag=999;
    [self.view addSubview:imageView];
    
    self.explosionCounter++;
    
}

#pragma mark - Number Generation
-(void)generateRandomValues {

    int value=0;
    int q1=0;
    int q2=0;
    int result=0;

    if (self.game.level==1) {
        value=98;
    } else if (self.game.level==2) {
        value=998;
    }


    // Question 1
    q1=arc4random() % value;
    
    // Question 2
    q2=arc4random() % value;

    self.question1.text=[NSString stringWithFormat:@"%d",q1];
    self.question2.text=[NSString stringWithFormat:@"%d",q2];

    int randomNumber=[self randomOperator];
    // Math Operator
    if (randomNumber==0) {
        self.mathOperator.text=@"+";
        result=q1+q2;
    } else if (randomNumber==1) {
        self.mathOperator.text=@"-";
        if (q1<q2 && self.game.level==1) {
            self.question1.text=[NSString stringWithFormat:@"%d",q2];
            self.question2.text=[NSString stringWithFormat:@"%d",q1];
            result=q2-q1;
        } else {
            result=q1-q2;
        }
    } else if (randomNumber==2) {
        self.mathOperator.text=@"X";
        result=q1*q2;
    } else if (randomNumber==3) {
        self.mathOperator.text=@"/";
        if (q1<q2 && self.game.level==1) {
            self.question1.text=[NSString stringWithFormat:@"%d",q2];
            self.question2.text=[NSString stringWithFormat:@"%d",q1];
            result=q2/q1;
        } else {
            result=q1/q2;
        }
    }

    // clean-up unique answers
    [self.answers removeAllObjects];
    [self.answers addObject:[NSString stringWithFormat:@"%d",result]];
    
    // Random values for the buttons
    [self.answer1 setTitle:[NSString stringWithFormat:@"%d",[self fakeNumberWithResult:result]] forState:UIControlStateNormal];
    [self.answer2 setTitle:[NSString stringWithFormat:@"%d",[self fakeNumberWithResult:result]] forState:UIControlStateNormal];
    [self.answer3 setTitle:[NSString stringWithFormat:@"%d",[self fakeNumberWithResult:result]] forState:UIControlStateNormal];
    [self.answer4 setTitle:[NSString stringWithFormat:@"%d",[self fakeNumberWithResult:result]] forState:UIControlStateNormal];
    
    
    // Plotting result in a random button
    self.correctPosition=arc4random() % 4;
    if (self.correctPosition==0) {
        [self.answer1 setTitle:[NSString stringWithFormat:@"%d",result] forState:UIControlStateNormal];
    } else if (self.correctPosition==1) {
        [self.answer2 setTitle:[NSString stringWithFormat:@"%d",result] forState:UIControlStateNormal];
    } else if (self.correctPosition==2) {
        [self.answer3 setTitle:[NSString stringWithFormat:@"%d",result] forState:UIControlStateNormal];
    } else if (self.correctPosition==3) {
        [self.answer4 setTitle:[NSString stringWithFormat:@"%d",result] forState:UIControlStateNormal];
    }
}

-(int)randomOperator
{
    if (self.game.level==1) {
        return arc4random() % 2;
    }else {
        return arc4random() % 4;
    }
}


#pragma mark - Sound Effects
-(void)playExplosionSound {
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundId);
    AudioServicesPlaySystemSound(soundId);
}

-(void)playCorrectAnswerSound {
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"correctAnswer" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundId);
    AudioServicesPlaySystemSound(soundId);
}

#pragma mark - Progress Timer Methods
-(void)startProgressTimer
{
    self.progressTimer=[NSTimer scheduledTimerWithTimeInterval:PROGRESS_TIMER_DURATION target:self selector:@selector(progressTimerPulse) userInfo:nil repeats:YES];
}
-(void)progressTimerPulse {
    if (self.progressBar.progress>=1.00) {
        [self progressTimerTimeOut];
        return;
    }
    self.progressBar.progress=self.progressBar.progress + PROGRESS_TIMER_BAR_SEED;
}

-(void)progressTimerTimeOut {
    [self.progressTimer invalidate];
    [self hideControls];
    [self playExplosionSound];
    [self startExplosion];
}


#pragma mark - Status Bar
-(BOOL)prefersStatusBarHidden {
    return YES;
}


@end
