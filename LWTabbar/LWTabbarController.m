//
//  LWTabbarController.m
//  LWTabbar
//
//  Created by Liu Wei on 16/9/5.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

#import "LWTabbarController.h"
#import "UIView+Frame.h"
#import "UIImage+Image.h"
#import "LWNavigationController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "MineViewController.h"
#import "LWCenterBtn.h"
#import "LWCenterViewController.h"
#define SCREENWIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
@interface LWTabbarController ()

@property (nonatomic, strong) LWCenterViewController * centerVC;
@end

@implementation LWTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent=NO;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bar"];
    self.tabBar.tintColor = [UIColor blackColor];
    
    [self setVC];
    [self setTabBarBorder];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setAddBtn];
}

-(void)setAddBtn{
    CGFloat BTNWidth = 75;
    UIButton * addBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"btn_card"] forState:UIControlStateNormal];
    addBtn.frame = CGRectMake((SCREENWIDTH - BTNWidth) / 2, -15, BTNWidth, BTNWidth);
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:addBtn];
}

-(void)addBtnClick{
    LWCenterViewController *centerVC = [[LWCenterViewController alloc] init];
    
    self.centerVC = centerVC;
    
    __weak typeof(self) weakSelf = self;
    _centerVC.closeView = ^{
        
        weakSelf.centerVC = nil;
        
    };
    
    [[UIApplication sharedApplication].keyWindow addSubview:_centerVC.view];

}

-(void)setTabBarBorder{
    UIImageView * imageView =[[UIImageView alloc]init];
    imageView.image =[UIImage imageNamed:@"tabbar_bg"];
    [imageView setContentMode:UIViewContentModeCenter];
    
    imageView.frame = CGRectMake(0, -5, self.tabBar.width, self.tabBar.height);
    [self.tabBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]]];
    [self.tabBar insertSubview:imageView atIndex:0];
}

-(void)setVC{
    [self setChildVCWithTitle:@"home" image:[UIImage imageNamed:@"recommendation_1"] selectImage:[UIImage imageNamed:@"recommendation_2"] ViewController:[[HomeViewController alloc]init]];
    
    [self setChildVCWithTitle:@"second" image:[UIImage imageNamed:@"broadwood_1"] selectImage:[UIImage imageNamed:@"broadwood_2"] ViewController:[[SecondViewController alloc]init]];
    
    [self setChildVCWithTitle:nil image:nil selectImage:nil ViewController:[[UIViewController alloc]init]];
    
    [self setChildVCWithTitle:@"third" image:[UIImage imageNamed:@"classification_1"] selectImage:[UIImage imageNamed:@"classification_2"] ViewController:[[ThirdViewController alloc]init]];
    
    [self setChildVCWithTitle:@"mine" image:[UIImage imageNamed:@"my_1"] selectImage:[UIImage imageNamed:@"my_2"] ViewController:[[MineViewController alloc]init]];
    
}

-(void)setChildVCWithTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage ViewController:(UIViewController *)viewController{
    
    LWNavigationController * vc =[[LWNavigationController alloc]initWithRootViewController:viewController];
    
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.title = title;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectImage;
    [self   addChildViewController:vc];
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
