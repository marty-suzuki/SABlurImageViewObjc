//
//  UIImage+BlurEffect.m
//  SABlurImageView
//
//  Created by 鈴木大貴 on 2015/04/17.
//  Copyright (c) 2015年 鈴木大貴. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "UIImage+BlurEffect.h"

@implementation UIImage (BlurEffect)

- (UIImage *)blurEffect:(CGFloat)boxSize {
    CGFloat boxSizeFinal = boxSize - fmodf(boxSize, 2) + 1;
    
    CGImageRef cgImage = self.CGImage;
    CGDataProviderRef inProvider = CGImageGetDataProvider(cgImage);
    
    vImage_Buffer inBuffer;
    inBuffer.height = (vImagePixelCount)CGImageGetHeight(cgImage);
    inBuffer.width = (vImagePixelCount)CGImageGetWidth(cgImage);
    inBuffer.rowBytes = CGImageGetBytesPerRow(cgImage);
    
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
    
    vImage_Buffer outBuffer;
    outBuffer.height = (vImagePixelCount)CGImageGetHeight(cgImage);
    outBuffer.width = (vImagePixelCount)CGImageGetWidth(cgImage);
    outBuffer.rowBytes = CGImageGetBytesPerRow(cgImage);
    outBuffer.data = malloc(CGImageGetBytesPerRow(cgImage) * CGImageGetHeight(cgImage));
    
    vImage_Error error;
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, boxSizeFinal, boxSizeFinal, nil, kvImageEdgeExtend);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, CGImageGetBitmapInfo(cgImage));
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *bluredImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    free(outBuffer.data);
    CFRelease(inBitmapData);
    
    //CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return  bluredImage;
}

@end