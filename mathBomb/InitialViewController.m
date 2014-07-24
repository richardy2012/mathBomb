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
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    // Load Game Level & Score
    self.game=[self.settings getGame];
    self.level.text=[NSString stringWithFormat:@"Level: %d",self.game.level];
    self.score.text=[NSString stringWithFormat:@"Score: %d",self.game.score];
   
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
