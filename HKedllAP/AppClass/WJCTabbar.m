//
//  WJCTabbar.m
//  PinchFish
//
//  Created by 进超王 on 16/9/30.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import "WJCTabbar.h"
#import "UIView+MJExtension.h"


@implementation WJCTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tabbarBackImgview = [[UIImageView alloc] init];
        self.tabbarBackImgview.image = [UIImage imageNamed:@"Combined Shape"];
        [self addSubview:self.tabbarBackImgview];
        
        self.placeOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.placeOrderBtn setImage:[UIImage imageNamed:@"Group"] forState:UIControlStateNormal];
        [self.placeOrderBtn setImage:[UIImage imageNamed:@"Group"] forState:UIControlStateSelected];
        [self.placeOrderBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.placeOrderBtn];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (touch.view == self.placeOrderBtn) {
            self.placeOrderBtn.selected = !self.placeOrderBtn.selected;
            // 通知代理
            if ([self.mDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
                [self.mDelegate tabBarDidClickPlusButton:self.placeOrderBtn.selected];
            }
        }
    }
}

/**
 *  加号按钮点击
 */
- (void)plusBtnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    // 通知代理
    if ([self.mDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        
        [self.mDelegate tabBarDidClickPlusButton:btn.selected];
    }
}


/**
 *  想要重新排布系统控件subview的布局，推荐重写layoutSubviews，在调用父类布局后重新排布。
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.tabbarBackImgview.frame = CGRectMake(0, -32, self.frame.size.width, 82);
    // 2.设置其他tabbarButton的frame
    CGFloat tabBarButtonW = self.mj_w / 3;
    CGFloat tabBarButtonIndex = 0   ;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置x
            child.mj_x = tabBarButtonIndex * tabBarButtonW;
            // 设置宽度
            child.mj_w = tabBarButtonW;
            // 增加索引
            tabBarButtonIndex++;
            
            if (tabBarButtonIndex == 1) {
                self.placeOrderBtn.mj_x = self.width / 2 - 29;
                self.placeOrderBtn.mj_w = 59;
                self.placeOrderBtn.mj_y = -18;
                self.placeOrderBtn.mj_h = 59;
                self.placeOrderBtn.layer.cornerRadius = 31;
                tabBarButtonIndex++;
            }
           
        }
    }
}



@end
