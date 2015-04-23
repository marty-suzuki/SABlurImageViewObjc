//
//  ViewController.m
//  SABlurImageViewObjcSample
//
//  Created by 鈴木大貴 on 2015/04/17.
//  Copyright (c) 2015年 鈴木大貴. All rights reserved.
//

#import "ViewController.h"
#import "SABlurImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *animationButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *applyButton;

@property (strong, nonatomic) SABlurImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (self.animationButton) {
        [self.animationButton addTarget:self action:@selector(didTapAnimationButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.slider) {
        [self.slider addTarget:self action:@selector(didChangeSliderValue:) forControlEvents:UIControlEventValueChanged];
    }
    
    if (self.applyButton) {
        [self.applyButton addTarget:self action:@selector(didTapApplyButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, false, 1.0);
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView = [[SABlurImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.image = image;
    
    if (self.animationButton) {
        [self.imageView configrationForBlurAnimation:100];
        [self.view insertSubview:self.imageView belowSubview:self.animationButton];
    }
    
    if (self.slider) {
        [self.imageView configrationForBlurAnimation:100];
        [self.view insertSubview:self.imageView belowSubview:self.slider];
    }
    
    if (self.applyButton) {
        [self.view insertSubview:self.imageView belowSubview:self.applyButton];
    }
    
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTapAnimationButton:(UIButton *)button {
    [self.imageView startBlurAnimation:2.0];
}

- (void)didChangeSliderValue:(UISlider *)slider {
    [self.imageView blur:slider.value];
}

- (void)didTapApplyButton:(UIButton *)button {
    [self.imageView addBlurEffect:10 times:1];
}

@end