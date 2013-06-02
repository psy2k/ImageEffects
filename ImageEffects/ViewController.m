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
@synthesize effectedImage;

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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
