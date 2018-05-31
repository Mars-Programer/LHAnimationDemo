//
//  CALayer+LHRotationAnimation.h
//  LHAnimationDemo
//
//  Created by 刘欢 on 2018/5/31.
//  Copyright © 2018年 小怪兽饲养猿. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/*
 *  反转方向
 */
typedef enum {
    
    //X
    AnimReverDirectionX=0,
    
    //Y
    AnimReverDirectionY,
    
    //Z
    AnimReverDirectionZ,
    
}AnimReverDirection;

@interface CALayer (LHRotationAnimation)


/**
 摇晃动画

 @param rotations 指定关键帧
 @param duration 动画时间
 @param repeatCount 重复次数
 @return CAAnimation
 */
-(CAAnimation *)shakeAnimationWithRotations:(NSArray *)rotations
                                   duration:(NSTimeInterval)duration
                                repeatCount:(NSUInteger)repeatCount;


/**
 翻转动画

 @param direction 方向
 @param duration 时间
 @param isReverse 自动反转
 @param repeatCount 重复次数
 @param timingFuncName 暂无用
 @return CAAnimation
 */
-(CAAnimation *)reversAnimationWithDirection:(AnimReverDirection)direction
                                    duration:(NSTimeInterval)duration
                                   isReverse:(BOOL)isReverse
                                 repeatCount:(NSUInteger)repeatCount
                              timingFuncName:(NSString *)timingFuncName;
@end
