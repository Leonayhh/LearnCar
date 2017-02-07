//
//  MineCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/10.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "MineCell.h"
#import "MineHeaderView.h"
#import "MessageCtrl.h"
#import "MyOrderCtrl.h"
#import "KaoTiCtrl.h"
#import "YHJCtrl.h"
#import "KFCtrl.h"
#import "SetCtrl.h"
#import "QBCtrl.h"
#import "MineInfoCtrl.h"


@interface MineCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) NSArray *cellArr;

@property (nonatomic, strong) NSArray *imgsArr;

@property (nonatomic, strong) MineHeaderView *headerView;

@end
