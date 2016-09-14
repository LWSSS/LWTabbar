//
//  LWNavigationController.m
//  LWTabbar
//
//  Created by Liu Wei on 16/9/5.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

#import "LWNavigationController.h"

@interface LWNavigationController ()

@end

@implementation LWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor =[UIColor blueColor];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed=YES;
        [super pushViewController:viewController animated:YES];
    }else{
        [super pushViewController:viewController animated:YES];
    }
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
