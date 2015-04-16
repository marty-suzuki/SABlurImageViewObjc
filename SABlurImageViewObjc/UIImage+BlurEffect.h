//
//  UIImage+BlurEffect.h
//  SABlurImageView
//
//  Created by 鈴木大貴 on 2015/04/17.
//  Copyright (c) 2015年 鈴木大貴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BlurEffect)

- (UIImage *)blurEffect:(CGFloat)boxSize;

@end