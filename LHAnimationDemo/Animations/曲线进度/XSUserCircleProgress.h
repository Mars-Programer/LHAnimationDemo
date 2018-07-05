//
//  XSUserCircleProgress.h
//  XingZhe
//
//  Created by 刘欢 on 2018/1/24.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSUserCircleProgress : UIView

/** 进度 */
@property (nonatomic, readonly) CGFloat progress;


/** 底层颜色 */
@property (nonatomic, strong) UIColor *bottomColor;


/** 初始化 */
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress;

- (void)setCurrentProgress:(CGFloat)progress;
@end
