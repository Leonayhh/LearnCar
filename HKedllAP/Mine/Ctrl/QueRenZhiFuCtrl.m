//
//  QueRenZhiFuCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/19.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "QueRenZhiFuCtrl.h"

@interface QueRenZhiFuCtrl ()

@end

@implementation QueRenZhiFuCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认支付";
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    
    self.myScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW,kScreenH - 114)];
    self.myScrollview.bounces = NO;
    [self.view addSubview:self.myScrollview];
    
    self.orderView = [[CustomOrderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 360)];
    [self.orderView setDataWithModel:nil];
    [self.myScrollview addSubview:self.orderView];
    
    self.infoView = [[[NSBundle mainBundle] loadNibNamed:@"OrderInfoView" owner:nil options:nil] lastObject];
    self.infoView.frame = CGRectMake(0,self.orderView.bottom + 10, kScreenW, 130);
    [self.myScrollview addSubview:self.infoView];
    
    self.peiJiaView = [[[NSBundle mainBundle] loadNibNamed:@"PeiJiaView" owner:nil options:nil] lastObject];
    self.peiJiaView.frame = CGRectMake(0, self.infoView.bottom + 10, kScreenW, 120);
    [self.myScrollview addSubview:self.peiJiaView];
    
    self.zhifuView = [[[NSBundle mainBundle] loadNibNamed:@"ZhiFuView" owner:nil options:nil] lastObject];
    self.zhifuView.frame = CGRectMake(0, self.peiJiaView.bottom + 10, kScreenW, 160);
    [self.myScrollview addSubview:self.zhifuView];
   
    self.myScrollview.contentSize = CGSizeMake(kScreenW, self.zhifuView.bottom + 10);
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH - 114, kScreenW, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    self.daiZhiFuLB = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 120, 20)];
    self.daiZhiFuLB.font = [UIFont systemFontOfSize:16];
    self.daiZhiFuLB.centerY = view.centerY;
    self.daiZhiFuLB.text = @"199元";
    self.daiZhiFuLB.textColor = [UIColor darkGrayColor];
    [self.view addSubview:self.daiZhiFuLB];
    
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.confirmBtn.frame = CGRectMake(kScreenW - 100,view.top, 100, 50);
    [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.confirmBtn.backgroundColor = RGBA(109, 203, 233, 1);
    [self.confirmBtn addTarget:self action:@selector(queRenBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.confirmBtn];
    
    self.diKouLB = [[UILabel alloc] initWithFrame:CGRectMake(140, 0, kScreenW - 140 - 100, 20)];
    self.diKouLB.font = [UIFont systemFontOfSize:13];
    self.diKouLB.centerY = view.centerY;
    self.diKouLB.text = @"抵扣199元";
    self.diKouLB.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.diKouLB];
}

- (void)queRenBtn {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
