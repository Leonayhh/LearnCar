//
//  QueRenZhiFuCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/19.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "CustomOrderView.h"
#import "PeiJiaView.h"
#import "OrderInfoView.h"
#import "ZhiFuView.h"


@interface QueRenZhiFuCtrl : HKAppVC

@property (nonatomic,strong)UIScrollView *myScrollview;

@property (nonatomic,strong)CustomOrderView *orderView;

@property (nonatomic,strong)PeiJiaView *peiJiaView;

@property (nonatomic,strong)OrderInfoView *infoView;

@property (nonatomic,strong)ZhiFuView *zhifuView;

@property (nonatomic,strong)UILabel *daiZhiFuLB;

@property (nonatomic,strong)UILabel *diKouLB;

@property (nonatomic,strong)UIButton *confirmBtn;

@end
