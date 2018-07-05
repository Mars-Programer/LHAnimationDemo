//
//  UIView+GradientLayer.h
//  XingZhe
//
//  Created by 刘欢 on 2018/3/9.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GradientLayer)

/** 渐变色（红）*/
- (CALayer *)gradientXZRedColor;

/** 渐变色（蓝）*/
- (CALayer *)gradientXZBlueColor;

/**
 Gradient Color
 
 @param fromColor start color
 @param toColor   end color
 */
- (CALayer *)gradientColorFromColor:(UIColor *)fromColor
                            toColor:(UIColor *)toColor;
@end
