//
//  LWCenterBtn.m
//  LWTabbar
//
//  Created by Liu Wei on 16/9/6.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

#import "LWCenterBtn.h"

@implementation LWCenterBtn

+ (instancetype) setButtonWithImage: (NSString *)imageName  title:(NSString *)titleName{
    LWCenterBtn  * button =[[LWCenterBtn alloc]init];
    button.imageName = imageName;
    button.titleName = titleName;
    button.titleLabel.backgroundColor=[UIColor redColor];
    return button;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat x = contentRect.size.width * 0.2;
    CGFloat y = contentRect.size.height * 0.2;
    CGFloat w = contentRect.size.width - x * 2;
    CGFloat h = contentRect.size.height * 0.5;
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat x = 0;
    CGFloat y = contentRect.size.height * 0.65;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height * 0.3;
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}

- (void)setTitle:(NSString *)title {
    _titleName = title;
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    
    
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

@end
