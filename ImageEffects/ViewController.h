//
//  ViewController.h
//  ImageEffects
//
//  Created by Nikolaos Maounis on 2/6/13.
//  Copyright (c) 2013 Nikolaos Maounis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *effectedImage;

@property (strong, nonatomic) IBOutlet UIButton *rippleEffect;
@property (strong, nonatomic) IBOutlet UIButton *addShadow;
@property (strong, nonatomic) IBOutlet UIButton *imageTransition;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) IBOutlet UIButton *spinButton;
@property (strong, nonatomic) IBOutlet UIButton *changePositionButton;
@property (strong, nonatomic) IBOutlet UIButton *gravityButton;
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
