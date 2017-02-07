//
//  HKBaseNavigationController.m
//  GangQinEJia
//
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "HKBaseNavigationController.h"

@interface HKBaseNavigationController ()

@end

@implementation HKBaseNavigationController


- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _isPanBack=YES;
    self.interactivePopGestureRecognizer.delegate = self;
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
    popRecognizer.delegate = self;
    popRecognizer.maximumNumberOfTouches = 1;
    [gestureView addGestureRecognizer:popRecognizer];

    //获取系统手势的target数组
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    //获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target
    id gestureRecognizerTarget = [_targets firstObject];
    //获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    //通过前面的打印，我们从控制台获取出来它的方法签名。
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    //创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
    [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
}
#pragma mark- 自定义的UIBarButtonItem按钮
-(UIBarButtonItem *)customLeftBackButton:(UIViewController *)viewController{

    UIImage *image_n=[UIImage imageNamed:@"topbar_back"];
    UIImage *image_s=[UIImage imageNamed:@"topbar_back"];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageEdgeInsets=UIEdgeInsetsMake(0, -20, 0, 0);
    btn.frame=CGRectMake(-20, 0, 30, 30);

    [btn setBackgroundImage:image_n forState:UIControlStateNormal];
    [btn setBackgroundImage:image_s forState:UIControlStateHighlighted];

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    return backItem;
}



#pragma mark-UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue]&&_isPanBack;
    
    
}


@end
