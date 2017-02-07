//
//  DingDanXiangQingCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/19.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "DingDanXiangQingCtrl.h"

@interface DingDanXiangQingCtrl ()

@end

@implementation DingDanXiangQingCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.myScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64 - 50)];
    self.myScrollview.bounces = NO;
    [self.view addSubview:self.myScrollview];
    
    self.dingDanInfoView = [[[NSBundle mainBundle] loadNibNamed:@"DingDanXiangQingView" owner:nil options:nil] lastObject];
    self.dingDanInfoView.frame = CGRectMake(0, 0, kScreenW, 440);
    [self.myScrollview addSubview:self.dingDanInfoView];
    
    self.peijiaView = [[[NSBundle mainBundle] loadNibNamed:@"PeiJiaView" owner:nil options:nil] lastObject];
    self.peijiaView.frame = CGRectMake(0, self.dingDanInfoView.bottom + 10, kScreenW, 120);
    [self.myScrollview addSubview:self.peijiaView];
    
    self.myScrollview.contentSize = CGSizeMake(kScreenW, self.peijiaView.bottom + 20 > kScreenH - 114 ? self.peijiaView.bottom + 20 : kScreenH - 114);
    
    UIView *tempview = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH - 64 - 50, kScreenW, 50)];
    tempview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tempview];
    
    self.quXiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.quXiaoBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.quXiaoBtn setTitleColor:RGBA(93, 113, 118, 1) forState:UIControlStateNormal];
    self.quXiaoBtn.frame = CGRectMake(kScreenW - 190, tempview.top + 10, 80, 30);
    self.quXiaoBtn.layer.cornerRadius = 5;
    self.quXiaoBtn.layer.borderWidth = 1;
    [self.quXiaoBtn addTarget:self action:@selector(fukuanAndQuXiao:) forControlEvents:UIControlEventTouchUpInside];
    self.quXiaoBtn.layer.borderColor = RGBA(93, 113, 118, 1).CGColor;
    [self.view addSubview:self.quXiaoBtn];
    
    self.fuKuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.fuKuanBtn setTitle:@"去付款" forState:UIControlStateNormal];
    [self.fuKuanBtn setTitleColor:RGBA(61, 195, 230, 1) forState:UIControlStateNormal];
    self.fuKuanBtn.frame = CGRectMake(kScreenW - 95, tempview.top + 10, 80, 30);
    self.fuKuanBtn.layer.cornerRadius = 5;
    self.fuKuanBtn.layer.borderWidth = 1;
    [self.fuKuanBtn addTarget:self action:@selector(fukuanAndQuXiao:) forControlEvents:UIControlEventTouchUpInside];
    self.fuKuanBtn.layer.borderColor = RGBA(61, 195, 230, 1).CGColor;
    [self.view addSubview:self.fuKuanBtn];

}

- (void)fukuanAndQuXiao:(UIButton *)btn {
    if (self.quXiaoBtn == btn) {
        PopTableview *tableView = [[PopTableview alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 240) withTittle:@[@"信息填写错误，误发订单",@"我不想下单了",@"教练以各种理由不来接我",@"联系不上对方",@"其它原因"]];
        KLCPopup *pop = [KLCPopup popupWithContentView:tableView showType:(KLCPopupShowTypeSlideInFromBottom) dismissType:KLCPopupDismissTypeSlideOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
        KLCPopupLayout layout = KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter, KLCPopupVerticalLayoutBottom);
        [pop showWithLayout:layout];
    } else if (self.fuKuanBtn == btn) {
        QueRenZhiFuCtrl *vc = [[QueRenZhiFuCtrl alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
