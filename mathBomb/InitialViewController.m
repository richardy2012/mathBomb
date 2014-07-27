//
//  InitialViewController.m
//  mathBomb
//
//  Created by Marcelo Sampaio on 7/23/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@end

#pragma mark - View Initialization
@implementation InitialViewController

@synthesize game,settings;
@synthesize level,score;
@synthesize medal1,medal2,medal3,medal4,medal5,medals;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // game & settings
    self.settings=[[Settings alloc]init];
    self.game=[[Game alloc]init];
    self.medals=[[Medals alloc]init];
    
    // Level will be available in future versions
    self.level.hidden=YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    // Load Game Level & Score
    self.game=[self.settings getGame];
    self.level.text=[NSString stringWithFormat:@"Level: %d",self.game.level];
    self.score.text=[NSString stringWithFormat:@"Score: %d",self.game.score];
    // Uptade medals
    [self displayMedalsWithScore:self.game.score];

}

#pragma mark - Working Methods
-(void)displayMedalsWithScore:(int)score
{
    int medalsQty=[self.medals medalsWithScore:self.game.score];
    if (medalsQty==0) {
        self.medal1.image=nil;
        self.medal2.image=nil;
        self.medal3.image=nil;
        self.medal4.image=nil;
        self.medal5.image=nil;
    } else if (medalsQty==1) {
        self.medal1.image=[UIImage imageNamed:@"goldMedal"];
        self.medal2.image=nil;
        self.medal3.image=nil;
        self.medal4.image=nil;
        self.medal5.image=nil;
    }  else if (medalsQty==2) {
        self.medal1.image=[UIImage imageNamed:@"goldMedal"];
        self.medal2.image=[UIImage imageNamed:@"goldMedal"];
        self.medal3.image=nil;
        self.medal4.image=nil;
        self.medal5.image=nil;
    }  else if (medalsQty==3) {
        self.medal1.image=[UIImage imageNamed:@"goldMedal"];
        self.medal2.image=[UIImage imageNamed:@"goldMedal"];
        self.medal3.image=[UIImage imageNamed:@"goldMedal"];
        self.medal4.image=nil;
        self.medal5.image=nil;
    }  else if (medalsQty==4) {
        self.medal1.image=[UIImage imageNamed:@"goldMedal"];
        self.medal2.image=[UIImage imageNamed:@"goldMedal"];
        self.medal3.image=[UIImage imageNamed:@"goldMedal"];
        self.medal4.image=[UIImage imageNamed:@"goldMedal"];
        self.medal5.image=nil;
    }  else if (medalsQty==5) {
        self.medal1.image=[UIImage imageNamed:@"goldMedal"];
        self.medal2.image=[UIImage imageNamed:@"goldMedal"];
        self.medal3.image=[UIImage imageNamed:@"goldMedal"];
        self.medal4.image=[UIImage imageNamed:@"goldMedal"];
        self.medal5.image=[UIImage imageNamed:@"goldMedal"];
    }
}

#pragma mark - Status Bar
-(BOOL)prefersStatusBarHidden {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
