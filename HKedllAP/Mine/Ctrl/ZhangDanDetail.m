//
//  ZhangDanDetail.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "ZhangDanDetail.h"

@interface ZhangDanDetail ()

@end

@implementation ZhangDanDetail

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"充值";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"账单详情";
    [self creatView];
}

- (void)creatView {
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.showsVerticalScrollIndicator = NO;
    self.mTableView.scrollEnabled = NO;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"ZhangDanDetailCell" bundle:nil] forCellReuseIdentifier:@"ZhangDanDetailCell"];
    [self.view addSubview:self.mTableView];
    
    self.headeView = [[[NSBundle mainBundle] loadNibNamed:@"ZhangDanDetailHeaderView" owner:nil options:nil] lastObject];
    self.headeView.frame = CGRectMake(0, 0, kScreenW, 95);
    self.mTableView.tableHeaderView = self.headeView;
    
}


#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhangDanDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZhangDanDetailCell" forIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
