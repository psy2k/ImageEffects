//
//  ViewController.m
//  ImageEffects
//
//  Created by Nikolaos Maounis on 2/6/13.
//  Copyright (c) 2013 Nikolaos Maounis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize effectedImage, addShadow, rippleEffect, imageTransition, resetButton, spinButton, gravityButton, animator, scaleBtn;
BOOL hasEffects = NO;
BOOL isSpin = NO;

// We will save the original position of the image to this variable
CGFloat originalPositionY;
CGFloat originalPositionX;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.effectedImage.image = [UIImage imageNamed:@"typpzflatlogo"];
    originalPositionX = self.effectedImage.layer.position.x;
    originalPositionY = self.effectedImage.layer.position.y;
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)rippleEffect:(id)sender {
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1.5f];
    //    [animation setTimingFunction: UIViewAnimationCurveEaseInOut];
    //    [animation setTimingFunction: [CAMediaTimingFunction UIViewAnimationCurveEaseInOut]];
    [animation setType:@"rippleEffect" ];
    [self.effectedImage.layer addAnimation:animation forKey:NULL];
}

- (IBAction)addShadow:(id)sender {
    if (hasEffects == NO){
            hasEffects = YES;
    [UIView animateWithDuration:1.5 animations:^(void) {
        self.effectedImage.alpha = 1;
        self.effectedImage.layer.shadowOpacity = 0.8;
        self.effectedImage.layer.shadowOffset =  CGSizeMake(0, 0);
        self.effectedImage.layer.shadowRadius = 5;
        self.effectedImage.layer.shadowColor = [UIColor blackColor].CGColor;
        [self.addShadow setTitle:@"Remove Shadow" forState:UIControlStateNormal];
    }];
     
    } else {
        hasEffects = NO;
        [UIView animateWithDuration:1.5 animations:^(void) {
            self.effectedImage.layer.shadowOpacity = 0.0;
            [self.addShadow setTitle:@"Add Shadow" forState:UIControlStateNormal];
        }];
    }
}
- (IBAction)scaleTransition:(id)sender {
    self.effectedImage.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        // animate it to the full transform (100% scale)
        self.effectedImage.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // Put here any code you like to be executed after animationc completion
        NSLog(@"Image scaled %@", @"Image scaled");
    }];
}

- (IBAction)imageTransition:(id)sender {
    int i = 0;
    self.effectedImage.image = [UIImage imageNamed:(i % 2) ? @"typpzflatlogo" : @"oldtyppzlogo"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    [self.effectedImage.layer addAnimation:transition forKey:nil];
}

- (IBAction)resetEffects:(id)sender {
    self.effectedImage.layer.shadowOpacity = 0.0;
    [self.effectedImage.layer removeAllAnimations];
    
    // Here we set the y value again to the default one in case we've pressed the change position button
    self.effectedImage.layer.position = CGPointMake(originalPositionX, originalPositionY);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startSpin:(id)sender {
    if (!isSpin){
        isSpin = YES;
        CABasicAnimation *spin;
        spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        spin.fromValue = @0.0f;
        spin.toValue = @(2*M_PI);
        spin.duration = 0.8; // How fast should the image spin
        spin.repeatCount = HUGE_VALF; // HUGE_VALF means infinite repeatCount
        [self.spinButton setTitle:@"Stop spinning" forState:UIControlStateNormal];
        [self.effectedImage.layer addAnimation:spin forKey:@"Spin"];
    } else {
        isSpin = NO;
        [self.effectedImage.layer removeAnimationForKey:@"Spin"];
        [self.spinButton setTitle:@"Spin" forState:UIControlStateNormal];
        
    }
}

- (IBAction)changePostion:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue = @300.0;
    animation.duration = 1.0;
    animation.repeatCount = HUGE_VALF;
    [self.effectedImage.layer addAnimation:animation forKey:@"positionAnimation"];    

}

- (IBAction)addGravity:(id)sender {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.effectedImage];
    UISnapBehavior *snapBehaviour = [[UISnapBehavior alloc] initWithItem:self.effectedImage snapToPoint:self.view.center];
    snapBehaviour.damping = 0.35f;
    [self.animator addBehavior:snapBehaviour];
}

@end
