//
//  SetCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "SetCell.h"
#import "FeedCtrl.h"
#import "AboutUsCtrl.h"
#import "ChangePwdCtrl.h"

@interface SetCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) NSArray *cellArr;

@property (nonatomic, strong) NSArray *imgsArr;

@end
