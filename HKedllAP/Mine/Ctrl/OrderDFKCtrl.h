//
//  OrderDFKCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "CustomOrderCell.h"
#import "QueRenZhiFuCtrl.h"
#import "DingDanXiangQingCtrl.h"

@interface OrderDFKCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource,CustomOrderCellDelegate>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) CustomOrderCell *tempCell;

@end