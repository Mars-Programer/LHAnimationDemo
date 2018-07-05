//
//  XSUserDataOverviewView.m
//  XingZhe
//
//  Created by 刘欢 on 2018/1/23.
//  Copyright © 2018年 imxingzhe.com. All rights reserved.
//

#import "XSUserOverviewDataView.h"
#import "XSUserCircleProgress.h"
#import "UIView+GradientLayer.h"
#import "CALayer+Heartbeat.h"

@interface XSUserOverviewDataView ()

@property (weak, nonatomic) IBOutlet UILabel *totalHotTextLabel;

@property (weak, nonatomic) IBOutlet XSUserCircleProgress *progressView;


@property (weak, nonatomic) IBOutlet UIView *gradientColorView;

@property (weak, nonatomic) IBOutlet UIImageView *showMedalIcon;

@end

@implementation XSUserOverviewDataView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle]loadNibNamed:@"XSUserOverviewDataView" owner:self options:nil].lastObject;
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self updatLayout];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self.progressView setCurrentProgress:progress];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.showMedalIcon.layer beginBounceAnimationWithPositionY:self.showMedalIcon.center.y range:3];
        
    });
}

/** 布局相关*/
- (void)updatLayout{    

    self.totalHotTextLabel.layer.cornerRadius = 9;
    self.totalHotTextLabel.clipsToBounds = YES;
    self.gradientColorView.layer.cornerRadius = 9;
    self.gradientColorView.clipsToBounds = YES;
    
    [self updateConstraints];
    [self.progressView layoutIfNeeded];
    
    [self.gradientColorView gradientXZRedColor];
}


//弃用
/** 勋章3D旋转动画相关*/
- (void)beganTransformMedal{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.showMedalIcon.layer.transform = [self firstStep];
        [UIView animateWithDuration:1 animations:^{
            self.showMedalIcon.layer.transform = CATransform3DMakeRotation(1, 0, 0, 0);
        }];
    });
 
}

-(CATransform3D)firstStep{
    //让transform1为单位矩阵
    CATransform3D transform1 = CATransform3DIdentity;
    //z轴纵深的3D效果和CATransform3DRotate配合使用才能看出效果
    //m34很重要
    transform1.m34 = 0.5/-100;
    //x和y都缩小为原来的0.9，z不变
    transform1 = CATransform3DScale(transform1, 1, 1, 1);
    //绕x轴向内旋转30度
    transform1 = CATransform3DRotate(transform1,180.f * M_PI/180.0f, 0, 1, 0);
    return transform1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
