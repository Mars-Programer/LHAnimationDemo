//
//  CALayer+Breathing.m
//  XingZhe
//
//  Created by 刘欢 on 2018/3/13.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import "CALayer+Heartbeat.h"

@implementation CALayer (Heartbeat)

- (void)beginBreathingAnimation{
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0.5;
    opacityAnimation.duration = 1;
    opacityAnimation.autoreverses = YES;
    opacityAnimation.repeatCount = INFINITY;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.removedOnCompletion = NO;
    [self addAnimation:opacityAnimation forKey:@"breathingAnimation"];
}

- (void)removeBreathAnimation{
    [self removeAnimationForKey:@"breathingAnimation"];
}

- (void)beginHeartbeatAnimation{
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    opacityAnimation.fromValue = @0.8;
    opacityAnimation.toValue = @1.2;
    opacityAnimation.duration = 0.5;
    opacityAnimation.autoreverses = YES;
    opacityAnimation.repeatCount = INFINITY;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.removedOnCompletion = NO;
    [self addAnimation:opacityAnimation forKey:@"beginHeartbeatAnimation"];
}

- (void)removeHeartbeatAnimation{
    [self removeAnimationForKey:@"beginHeartbeatAnimation"];
}

- (void)beginBounceAnimationWithPositionY:(CGFloat)y range:(CGFloat)range{
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    opacityAnimation.fromValue = @(y - range);
    opacityAnimation.toValue = @(y + range);
    opacityAnimation.duration = 1;
    opacityAnimation.autoreverses = YES;
    opacityAnimation.repeatCount = INFINITY;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.removedOnCompletion = NO;
    [self addAnimation:opacityAnimation forKey:@"beginBounceAnimation"];
}

- (void)removeBounceAnimation{
    [self removeAnimationForKey:@"beginBounceAnimation"];
}

@end
