//
//  ZhangDanDetail.h
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "ZhangDanDetailCell.h"
#import "ZhangDanDetailHeaderView.h"

@interface ZhangDanDetail : HKAppVC<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) ZhangDanDetailHeaderView *headeView;

@end
