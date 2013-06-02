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
@synthesize effectedImage, addShadow, rippleEffect, imageTransition;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.effectedImage.image = [UIImage imageNamed:@"typpzflatlogo"];
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
    [UIView animateWithDuration:1.5 animations:^(void) {
        self.effectedImage.alpha = 1;
        self.effectedImage.layer.shadowOpacity = 0.8;
        self.effectedImage.layer.shadowOffset =  CGSizeMake(0, 0);
        self.effectedImage.layer.shadowRadius = 5;
        self.effectedImage.layer.shadowColor = [UIColor blackColor].CGColor;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
