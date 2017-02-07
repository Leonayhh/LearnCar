//
//  MessageCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "MsgCell.h"

@interface MessageCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) NSArray *infoArr;

@property (nonatomic, assign) BOOL isAppeare;


@end
