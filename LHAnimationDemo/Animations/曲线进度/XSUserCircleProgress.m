//
//  XSUserCircleProgress.m
//  XingZhe
//
//  Created by 刘欢 on 2018/1/24.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import "XSUserCircleProgress.h"


//线宽度
static const CGFloat layerWidth = 5;

@interface XSUserCircleProgress ()

/** 底层显示层 */
@property (nonatomic, strong) CAShapeLayer *topLayer;
/** 顶层显示层 */
@property (nonatomic, strong) CAShapeLayer *bottomLayer;

@property (nonatomic, readwrite) CGFloat progress;
@end

@implementation XSUserCircleProgress

- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress {
    if (self) {
        self = [super initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
        [self commonInit];
//        self.progress = progress;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect{
    
    [self commonInit];
}

//- (CAShapeLayer *)topLayer {
//    if (!_topLayer) {
//        _topLayer = [CAShapeLayer layer];
//        _topLayer.lineWidth = layerWidth;
//        _topLayer.lineCap = kCALineCapRound;
//        _topLayer.fillColor = [UIColor clearColor].CGColor;
//        _topLayer.strokeColor = [UIColor whiteColor].CGColor;
//    }
//    return _topLayer;
//}

- (CAShapeLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CAShapeLayer layer];
        _bottomLayer.lineCap = kCALineCapRound;
        _bottomLayer.lineWidth = layerWidth;
        _bottomLayer.fillColor = [UIColor clearColor].CGColor;
    }
    return _bottomLayer;
}

#pragma mark - 初始化
- (void)commonInit{
    
    [self progressPathForLayer];
    
    [self gradient];
}

/** 绘制layer 路径*/
- (void)progressPathForLayer{
    
    UIColor *color = [UIColor colorWithRed:225.0 / 255.0
                                           green:226.0 / 255.0
                                            blue:230.0/255.0
                                     alpha:1];
    self.bottomLayer.strokeColor = (self.bottomColor?self.bottomColor:color).CGColor;
    self.bottomLayer.path = [self arcProgressPath];
    
    [self.layer addSublayer:self.bottomLayer];
}

//弧形路径
- (CGPathRef)arcProgressPath{
    
    CGPoint origin = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2  );
    CGFloat radius = self.frame.size.width / 2 - layerWidth ;
    
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:origin
                                                                radius:radius
                                                            startAngle:- M_PI_4 * 5
                                                              endAngle:M_PI_4
                                                             clockwise:YES];
    return progressPath.CGPath;
}

/** 设置渐变层 */
- (void)gradient {
    
    self.topLayer = [CAShapeLayer layer];
    self.topLayer.lineWidth = layerWidth;
    self.topLayer.lineCap = kCALineCapRound;
    self.topLayer.fillColor = [UIColor clearColor].CGColor;
    self.topLayer.strokeColor = [UIColor whiteColor].CGColor;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0,0,self.frame.size.width,self .frame.size.height);
    gradient.colors = @[(id)[UIColor colorWithRed:1
                                            green:178 / 255.0
                                             blue:101 / 255.0
                                            alpha:1].CGColor,
                            (id)[UIColor colorWithRed:1
                                                green:69 / 255.0
                                                 blue:69 / 255.0
                                                alpha:1].CGColor];
//    [gradient setLocations:@[@0, @0.5, @1]];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1.0, 0);
    self.topLayer.path = [self arcProgressPath];
    [gradient setMask:self.topLayer];
    [self.layer addSublayer:gradient];
    
    [self setCurrentProgress:_progress];
}

#pragma mark - setMethod
- (void)setCurrentProgress:(CGFloat)progress {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2;
//    animation.fromValue = @(_progress);
//    animation.toValue = @(progress);
    self.topLayer.strokeEnd = progress;

    [self.topLayer addAnimation:animation forKey:@"animationStrokeEnd"];
    [CATransaction commit];
    
    _progress = progress;

}

- (void)setBottomColor:(UIColor *)bottomColor {
    _bottomColor = bottomColor;
    self.bottomLayer.strokeColor = _bottomColor.CGColor;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
