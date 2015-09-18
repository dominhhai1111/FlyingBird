//
//  ViewController.m
//  Flying Bird
//
//  Created by Do Minh Hai on 9/1/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView* background;
    UIImageView* bird;
    int i ;
    NSTimer* _timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self DrawJungle];
    [self addBird];
    [self flyingUpAndDown];
    //[self Animation];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(Animation) userInfo:nil repeats:YES];
}
-(void)DrawJungle
{
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
   // background.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
}
-(void)addBird
{
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0.png"],
                             [UIImage imageNamed:@"bird1.png"],
                             [UIImage imageNamed:@"bird2.png"],
                             [UIImage imageNamed:@"bird3.png"],
                             [UIImage imageNamed:@"bird4.png"],
                             [UIImage imageNamed:@"bird5.png"]];
    bird.animationRepeatCount = -1;
    bird.animationDuration = 1;
    [self.view addSubview:bird];
    [bird startAnimating];
}
-(void) Animation
{
    UIImageView* HieuUng = [[UIImageView alloc] initWithFrame:self.view.bounds];
    HieuUng.animationImages = @[[UIImage imageNamed:@"images-15.jpeg"],[UIImage imageNamed:@"White.png"]];
    HieuUng.animationRepeatCount = 3 ;
    HieuUng.animationDuration=0.7;
    [self.view addSubview:HieuUng];
    if (i == 2 && bird.center.x==(self.view.bounds.size.width)/2) {
        
        [HieuUng startAnimating];
        [bird setHidden:YES];
                [_timer invalidate];
            }
}
-(void) flyingUpAndDown
{
    if (i<1) {
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished){
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:2 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            
            [self flyingUpAndDown];
            i++;
        }];
    }];
           }
    if(i==1){
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.75 animations:^{
        bird.center = CGPointMake((self.view.bounds.size.width)/2, (self.view.bounds.size.height)/2);
    }completion:^(BOOL finished) {
        [self flyingUpAndDown];
        i++;
    }];
     
    }
    
    
    
    
}
@end
