//
//  QBCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "QBCtrl.h"

@interface QBCtrl ()

@end

@implementation QBCtrl
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 240, self.view.width, self.view.height - 240) style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"QBCell" bundle:nil] forCellReuseIdentifier:@"QBCell"];
    [self.view addSubview:self.mTableView];
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"QBHeaderView" owner:nil options:nil] lastObject] ;
    [self.headerView.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.headerView.frame = CGRectMake(0, 0, kScreenW, 240);
    [self.headerView.tiXianBtn addTarget:self action:@selector(tixian) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.chongZhiBtn addTarget:self action:@selector(chongZhi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.headerView];
}

- (void)tixian {
    TiXianCtrl *vc = [[TiXianCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)chongZhi {
    ChongZhiCtrl *vc = [[ChongZhiCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QBCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZhangDanDetail *vc = [[ZhangDanDetail alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
