//
//  LWCenterBtn.h
//  LWTabbar
//
//  Created by Liu Wei on 16/9/6.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWCenterBtn : UIButton

@property (nonatomic, strong) NSString * imageName;

@property (nonatomic, strong) NSString * titleName;

+ (instancetype) setButtonWithImage: (NSString *)imageName  title:(NSString *)titleName;
@end
