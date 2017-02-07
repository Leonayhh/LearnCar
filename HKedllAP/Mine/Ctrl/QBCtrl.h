//
//  QBCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "QBCell.h"
#import "QBHeaderView.h"
#import "ZhangDanDetail.h"
#import "TiXianCtrl.h"
#import "ChongZhiCtrl.h"

@interface QBCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic,strong) QBHeaderView *headerView;

@end
