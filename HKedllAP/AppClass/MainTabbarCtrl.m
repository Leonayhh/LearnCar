//
//  MainTabbarCtrl.m
//  HKedllAP
//
//  Created by 进超王 on 16/10/21.
//  Copyright © 2016年 kedll. All rights reserved.
//

#import "MainTabbarCtrl.h"

@interface MainTabbarCtrl ()

@end

@implementation MainTabbarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTabbar = [[WJCTabbar alloc] init];
    self.myTabbar.mDelegate = self;
    [self setValue:self.myTabbar forKey:@"tabBar"];
    
    
//    去掉tabbar的顶部黑线
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = RGBA(245, 245, 245, 1);
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;
    
    // 首页
    HomeCtrl *homeVC = [[HomeCtrl alloc] init];
    [self addChildVc:homeVC title:@"首页" image:@"homeSelect" selectedImage:@"homeSelect" ];
    
    // 我的
    MineCtrl *mineVC = [[MineCtrl alloc] init];
    [self addChildVc:mineVC title:@"我的" image:@"mine" selectedImage:@"mine"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    childVc.view.backgroundColor = [UIColor redColor];
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    
    //    // 禁用图片渲染
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBA(133, 133, 133, 1)} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBA(37, 189, 255, 1)} forState:UIControlStateSelected];
    childVc.view.backgroundColor = [UIColor whiteColor]; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    // 为子控制器包装导航控制器
    HKBaseNavigationController *itemNav=[[HKBaseNavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:itemNav];
}


- (void)tabBarDidClickPlusButton:(BOOL)isPresent {
    UIViewController *rootVC = [XYUtils getCurrentRootViewController];
    MainTabbarCtrl *vc = (MainTabbarCtrl *)rootVC;
    UIViewController *currentVC = ((UINavigationController *)(vc.viewControllers[vc.selectedIndex])).viewControllers.lastObject;
    if (isPresent) {
        self.orderView = [[placeOrderView alloc]init];
        self.orderView.backgroundColor = [UIColor redColor];
        self.orderView.alpha = 0.3;
        if (currentVC.navigationController.navigationBar.hidden) {
            self.orderView.frame = CGRectMake(0, 0, kScreenW, kScreenH - 49);
        } else {
            self.orderView.frame = CGRectMake(0, 0, kScreenW, kScreenH - 49);
            self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 64)];
            self.topView.backgroundColor = [UIColor redColor];
            self.topView.alpha = 0.3;
            [[UIApplication sharedApplication].delegate.window addSubview:self.topView];
        }
        [currentVC.view addSubview:self.orderView];
    } else {
        for (id view in currentVC.view.subviews) {
            if ([view isMemberOfClass:[placeOrderView class]]) {
                [view removeFromSuperview];
                if (!currentVC.navigationController.navigationBar.hidden) {
                    [self.topView removeFromSuperview];
                }
            }
        }
    }
    
}




@end
