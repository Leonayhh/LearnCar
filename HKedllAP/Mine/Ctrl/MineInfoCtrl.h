//
//  MineInfoCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "MineInfoCell.h"
#import "MineInfoOneCell.h"
#import "ChangeNameCtrl.h"
#import "BindPhoneCtrl.h"
#import "ReallyNamrCtrl.h"
#import "AddressCtrl.h"

@interface MineInfoCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) NSArray *cellArr;

@property (nonatomic, strong) NSArray *imgsArr;



@end
