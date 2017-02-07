//
//  HKBaseViewController.m
//  GangQinEJia
//
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "HKBaseViewController.h"

@interface HKBaseViewController ()

@end

@implementation HKBaseViewController
@synthesize navigationBar;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationBar=[UINavigationBar appearance];
        [self setNavigationBar];
        
        if([self isKindOfClass:[MineCtrl class]]||[self isKindOfClass:[HomeCtrl class]]){
            self.navigationItem.leftBarButtonItem = nil;
        }else{
            self.hidesBottomBarWhenPushed=YES;//push的时候隐藏tabbar
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
}


-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate{
    return YES;
}

-(void)setNavigationBar{
    //关闭scrollView 向下的64偏移
    self.automaticallyAdjustsScrollViewInsets=NO;
    //设置字体颜色
    [navigationBar setTintColor:[UIColor whiteColor]];
    
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navagationBar"] forBarMetrics:UIBarMetricsDefault];
//    //消除阴影
    self.navigationBar.shadowImage = [UIImage new];
    
    
    //左边按钮
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
    if([self isKindOfClass:[MineCtrl class]]||[self isKindOfClass:[HomeCtrl class]]){
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        [btn setImage:[UIImage imageNamed:@"back_.png"] forState:0];
    }
    
    [btn addTarget:self action:@selector(onBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbtn=[[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backbtn;
}

-(void)NeedRefreshFatherCtrl:(id)obj{

}

- (void)OnSubCtrlCallRC:(id)obj{

}

-(void)onBackBtnClick:(UIButton *)btn{
    if(self.navigationController.viewControllers.count>1){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
//延迟调用的方法
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}


@end
