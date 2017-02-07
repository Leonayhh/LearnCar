//
//  DingDanXiangQingCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/19.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "DingDanXiangQingView.h"
#import "PeiJiaView.h"
#import "QueRenZhiFuCtrl.h"
#import "KLCPopup.h"
#import "PopTableview.h"

@interface DingDanXiangQingCtrl : HKAppVC

@property (nonatomic, strong) PeiJiaView *peijiaView;

@property (nonatomic, strong) DingDanXiangQingView *dingDanInfoView;

@property (nonatomic, strong) UIScrollView *myScrollview;

@property (nonatomic, strong) UIButton *quXiaoBtn;

@property (nonatomic, strong) UIButton *fuKuanBtn;

@end
