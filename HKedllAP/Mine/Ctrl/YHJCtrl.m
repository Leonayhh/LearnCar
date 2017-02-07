//
//  YHJCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "YHJCtrl.h"

@interface YHJCtrl ()

@end

@implementation YHJCtrl

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)setUpView {
    NSArray *array = @[@"可用优惠劵",@"已使用优惠劵",@"过期优惠劵"];
    NSArray *arr = @[@"KeYongJCtrl",@"YiYongJCtrl",@"GuoQiJCtrl"];
    //4页内容的scrollView
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, kScreenW, kScreenH - 44 - 64)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(kScreenW*array.count, kScreenH - 44 - 64);
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.bounces = NO;
    for (int i=0; i<array.count; i++) {
        UIViewController *vc = [[NSClassFromString(arr[i]) alloc] init];
        [self addChildViewController:vc];
        vc.view.frame = CGRectMake(kScreenW*i, 0, kScreenW, kScreenH-44 - 64);
        [scroll addSubview:vc.view];
    }
    [self.view addSubview:scroll];
    
    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = kScreenW/3.0;
    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    
    __weak typeof (scroll)weakScrollView = scroll;
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];
        
    }];
    [self.view addSubview:_itemControlView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的优惠劵";
    [self setUpView];
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
