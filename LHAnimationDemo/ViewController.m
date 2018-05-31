//
//  ViewController.m
//  LHAnimationDemo
//
//  Created by 刘欢 on 2018/5/31.
//  Copyright © 2018年 小怪兽饲养猿. All rights reserved.
//

#import "ViewController.h"
#import "CALayer+Heartbeat.h"
#import "CALayer+LHRotationAnimation.h"
#import "CALayer+LHTransitionAnimation.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *heatImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"呼吸";
    [self.heatImageView.layer beginBreathingAnimation];

}

- (IBAction)selectedAnimatedType:(UISegmentedControl *)sender {
    
    [self.heatImageView.layer removeAllAnimations];
    switch (sender.selectedSegmentIndex) {
        case 0:{
            self.title = @"呼吸";
            [self.heatImageView.layer beginBreathingAnimation];
        }
            break;
        case 1:{
            self.title = @"缩放心跳";
            [self.heatImageView.layer beginHeartbeatAnimation];

        }
            break;
        case 2:{
            self.title = @"跳动";

            [self.heatImageView.layer beginBounceAnimationWithPositionY:self.heatImageView.center.y range:10];
            
        }
            break;
        case 3:{
            self.title = @"摇晃";

            [self.heatImageView.layer shakeAnimationWithRotations:@[@(-0.2),@0.2]
                                                         duration:0.25
                                                      repeatCount:100];
            
        }
            break;
        case 4:{
            self.title = @"翻转";

            [self.heatImageView.layer reversAnimationWithDirection:AnimReverDirectionY
                                                          duration:1
                                                         isReverse:YES
                                                       repeatCount:100
                                                    timingFuncName:nil];
            
        }
            break;
        default:
            break;
    }
}

- (IBAction)selectedTransitionType:(UISegmentedControl *)sender {

    UIViewController *vc = [[UIViewController alloc]init];
    UIImageView *image = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    image.image = [UIImage imageNamed:@"WechatIMG29.jpeg"];
    [vc.view addSubview:image];
    [self.navigationController pushViewController:vc animated:NO];
    [self.navigationController.view.layer transitionWithAnimType:(TransitionAnimType)sender.selectedSegmentIndex
                                                         subType:TransitionSubtypesFromRamdom
                                                           curve:TransitionCurveEaseInEaseOut duration:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
