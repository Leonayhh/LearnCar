//
//  GuoQiJCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "GuoQiJCtrl.h"

@interface GuoQiJCtrl ()

@end

@implementation GuoQiJCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
}

- (void)creatView {
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64 - 44) style:UITableViewStyleGrouped];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.showsVerticalScrollIndicator = NO;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"OrderYHJCell" bundle:nil] forCellReuseIdentifier:@"OrderYHJCell"];
    [self.view addSubview:self.mTableView];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];
    self.mTableView.tableHeaderView = view1;
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];
    self.mTableView.tableFooterView = view2;
    
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
}


#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderYHJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderYHJCell" forIndexPath:indexPath];
    cell.backImgview.image = [UIImage imageNamed:@"YishiYong"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = RGBA(237, 237, 237, 1);
    return view1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
