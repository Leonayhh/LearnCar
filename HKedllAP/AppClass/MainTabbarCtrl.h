//
//  MainTabbarCtrl.h
//  HKedllAP
//
//  Created by 进超王 on 16/10/21.
//  Copyright © 2016年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCtrl.h"
#import "LoginCtrl.h"
#import "placeOrderView.h"
#import "MineCtrl.h"

@interface MainTabbarCtrl : UITabBarController<WJCTabbarDelegate>


@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) placeOrderView *orderView;

@property (nonatomic, strong) WJCTabbar *myTabbar;


@end
