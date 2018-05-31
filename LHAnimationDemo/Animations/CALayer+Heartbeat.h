//
//  CALayer+Breathing.h
//  XingZhe
//
//  Created by 大欢哥 on 2018/3/13.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Heartbeat)

/** 呼吸动画*/
- (void)beginBreathingAnimation;

- (void)removeBreathAnimation;

/** 心跳缩放动画*/
- (void)beginHeartbeatAnimation;

- (void)removeHeartbeatAnimation;

/** 弹跳动画*/
- (void)beginBounceAnimationWithPositionY:(CGFloat)y range:(CGFloat)range;

- (void)removeBounceAnimation;

@end
