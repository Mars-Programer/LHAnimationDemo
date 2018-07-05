//
//  UIView+GradientLayer.m
//  XingZhe
//
//  Created by 刘欢 on 2018/3/9.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import "UIView+GradientLayer.h"

@implementation UIView (GradientLayer)


- (CALayer *)gradientXZRedColor{
    
    UIColor *endColor = [UIColor colorWithRed:1
                                        green:73 / 255.0
                                         blue:69 / 255.0
                                        alpha:1];
    
    UIColor *startColor = [UIColor colorWithRed:1
                                          green:176 / 255.0
                                           blue:100 / 255.0
                                          alpha:1];
    
    return [self gradientColorFromColor:startColor toColor:endColor];
}

//渐变色（蓝）
- (CALayer *)gradientXZBlueColor{
    
    UIColor *endColor = [UIColor colorWithRed:46 / 255.0
                                        green:181 / 255.0
                                         blue:242 / 255.0
                                        alpha:1];
    
    UIColor *startColor = [UIColor colorWithRed:0 / 255.0
                                          green:170 / 255.0
                                           blue:255 / 255.0
                                          alpha:1];
    
    return [self gradientColorFromColor:startColor toColor:endColor];
}

- (CALayer *)gradientColorFromColor:(UIColor *)fromColor
                            toColor:(UIColor *)toColor
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)fromColor.CGColor, (__bridge id)toColor.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
//    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
    

    
    return gradientLayer;
}
@end
