//
//  OrderYWCCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "OrderYWCCtrl.h"

@interface OrderYWCCtrl ()

@end

@implementation OrderYWCCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64 - 54) style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mTableView];
    
    UIView *headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0.01)];
    self.mTableView.tableHeaderView = headerview;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0.01)];
    self.mTableView.tableFooterView = footView;
    
    self.tempCell = [[CustomOrderCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    self.tempCell.width = kScreenW;
}

#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tempCell setDataWithModel:nil];
    return self.tempCell.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"ordercwll";
    CustomOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[CustomOrderCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    [cell setDataWithModel:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
