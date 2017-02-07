//
//  OrderTKCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "CustomOrderCell.h"

@interface OrderTKCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) CustomOrderCell *tempCell;

@end
