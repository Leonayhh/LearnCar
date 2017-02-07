//
//  WJCTabbar.h
//  PinchFish
//
//  Created by 进超王 on 16/9/30.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJCTabbar;

@protocol WJCTabbarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton:(BOOL)isPresent;

@end


@interface WJCTabbar : UITabBar

@property (nonatomic, strong) UIImageView *tabbarBackImgview;

@property (nonatomic, strong) UIButton *placeOrderBtn;

@property (nonatomic, weak) id<WJCTabbarDelegate> mDelegate;

@end
