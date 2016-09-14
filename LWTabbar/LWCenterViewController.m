//
//  LWCenterViewController.m
//  LWTabbar
//
//  Created by Liu Wei on 16/9/6.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

#import "LWCenterViewController.h"
#import "LWCenterBtn.h"
#import "UIView+Frame.h"

#define screenWidth  [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

@interface LWCenterViewController ()
@property (nonatomic, strong) UIButton * actionBtn;
@end

@implementation LWCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBlurEffect * blur =[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView * visualView = [[UIVisualEffectView alloc]init];
    visualView.frame = self.view.frame;
    visualView.effect = nil;
    [UIView animateWithDuration:0.01 animations:^{
        visualView.effect = blur;
    }];
    
    [self.view addSubview:visualView];
    
    
    LWCenterBtn * btn1 = [LWCenterBtn setButtonWithImage:@"tabbar_compose_camera" title:@"camera"];
    LWCenterBtn * btn2 = [LWCenterBtn setButtonWithImage:@"tabbar_compose_friend" title:@"friend"];
    LWCenterBtn * btn3 = [LWCenterBtn setButtonWithImage:@"tabbar_compose_music" title:@"music"];
    LWCenterBtn * btn4 = [LWCenterBtn setButtonWithImage:@"tabbar_compose_idea" title:@"idea"];
    LWCenterBtn * btn5 = [LWCenterBtn setButtonWithImage:@"tabbar_compose_delete" title:@"delete"];
    LWCenterBtn * btn6 = [LWCenterBtn setButtonWithImage:@"tabbar_compose_more" title:@"more"];
    
    NSArray * btnSrr =@[btn1,btn2,btn3,btn4,btn5,btn6];
    int i = 3;
    CGFloat btnW = 120;
    CGFloat margin = (self.view.width - i* btnW) / (i+1);
    CGFloat x = 0;
    CGFloat y = 0;
    
    CGFloat oriY = 200;
    int currI = 0;int currRow = 0;
    for (int p = 0 ; p < btnSrr.count; p++) {
        UIButton * button = btnSrr[p];
        button.tag = p;
        
        currI = p % i;
        currRow = p / i;
        
        x = margin + (margin + btnW) * currI;
        y = oriY + (margin + btnW) * currRow;
        
        button.frame =CGRectMake(x, y, btnW, btnW);
        [self.view addSubview:button];
        button.transform = CGAffineTransformMakeTranslation(0, screenHeight);
        
        [button addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIView * bottomView =[[UIView alloc]init];
    bottomView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
    
    CGFloat viewH = 49;
    bottomView.frame = CGRectMake(0,screenHeight - viewH, screenWidth, viewH);
    [self.view addSubview:bottomView];
    
    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.userInteractionEnabled=NO;
    [closeBtn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
    CGFloat closeW = 25;
    closeBtn.frame = CGRectMake((bottomView.width - closeW) / 2, (bottomView.height - closeW) * 0.5, closeW, closeW);
    [bottomView addSubview:closeBtn];
    
    self.actionBtn = closeBtn;
    self.actionBtn.transform = CGAffineTransformMakeRotation(-M_PI_4);
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    for (int i = 0; i < self.view.subviews.count; i++) {
        
        UIView *view = self.view.subviews[i];
        
        if ([view isKindOfClass:[LWCenterBtn class]]) {
            
            [UIView animateWithDuration:0.5 delay:i * 0.05 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                
                view.transform = CGAffineTransformIdentity;
                
            } completion:nil];
            
        }
        
    }
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.actionBtn.transform = CGAffineTransformIdentity;
        
    }];
    
}

- (void)closeClick:(UIButton *)btn {
    
    for (int i = 0; i < self.view.subviews.count; i++) {
        UIView *view = self.view.subviews[i];
        
        if ([view isKindOfClass:[LWCenterBtn class]]) {
            
            if (btn == view) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    
                    btn.layer.transform = CATransform3DMakeScale(3.0, 3.0, 1);
                    btn.alpha = 0;
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:0.25 animations:^{
                        
                        self.view.alpha = 0;
                    } completion:^(BOOL finished) {
                        
                        self.closeView();
                    }];
                    
                    
                }];
                
            }else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    
                    CGAffineTransformMakeScale(0.001, 0.001);
                    
                    view.alpha = 0;
                    
                }];
                
            }
            
        }
        
        
    }
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [self close];
    
}

- (void)close {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.actionBtn.transform = CGAffineTransformMakeRotation(-M_PI_4);
        
        
    }];
    
    NSArray *subView = self.view.subviews;
    
    NSArray *array = [[subView reverseObjectEnumerator] allObjects];
    
    
    for (int i = 0; i < array.count; i++) {
        
        UIView *view = array[i];
        
        if ([view isKindOfClass:[LWCenterBtn class]]) {
            
            
            [UIView animateWithDuration:0.5 delay: i * 0.05 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                
                view.transform = CGAffineTransformMakeTranslation(0, screenWidth);
                
            } completion:nil];
            
        }
        
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.view.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            self.closeView();
            
            
        }];
        
        
    });
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
