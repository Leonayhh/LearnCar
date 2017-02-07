//
//  MineCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/10.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "MineCtrl.h"

@interface MineCtrl ()

@end

@implementation MineCtrl
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (NSArray *)cellArr {
    if (!_cellArr) {
        NSArray *one = [NSArray arrayWithObjects:@"我的订单",@"驾校考题", nil];
        NSArray *two = [NSArray arrayWithObjects:@"我的优惠劵",@"我的钱包",@"客服", nil];
        NSArray *three = [NSArray arrayWithObjects:@"设置", nil];
        _cellArr = [NSArray arrayWithObjects:one,two,three,nil];
    }
    return _cellArr;
}

- (NSArray *)imgsArr {
    if (!_cellArr) {
        NSArray *one = [NSArray arrayWithObjects:@"mineOrder",@"kaoti", nil];
        NSArray *two = [NSArray arrayWithObjects:@"youhuijuan",@"qianbao",@"kefu", nil];
        NSArray *three = [NSArray arrayWithObjects:@"shezhi", nil];
        _imgsArr = [NSArray arrayWithObjects:one,two,three,nil];
    }
    return _imgsArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64 - 49) style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.scrollEnabled = NO;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"MineCell" bundle:nil] forCellReuseIdentifier:@"MineCell"];
    [self.view addSubview:self.mTableView];
    
    self.headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 220)];
    [self.headerView.messageBtn addTarget:self action:@selector(mesBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.headerBtn addTarget:self action:@selector(headerClick) forControlEvents:UIControlEventTouchUpInside];
    self.mTableView.tableHeaderView = self.headerView;
}

- (void)mesBtnClick {
    MessageCtrl *vc = [[MessageCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)headerClick {
    MineInfoCtrl *vc = [[MineInfoCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 3;
    } else if (section == 2) {
        return 1;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.imgsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell" forIndexPath:indexPath];
    cell.contentLB.text = self.cellArr[indexPath.section][indexPath.row];
    cell.imgView.image = [UIImage imageNamed:self.imgsArr[indexPath.section][indexPath.row]];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                cell.imgW.constant = 18;
                cell.imgH.constant = 20;
                break;
            }
            case 1:{
                cell.imgW.constant = 20;
                cell.imgH.constant = 20;
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                cell.imgW.constant = 20;
                cell.imgH.constant = 16;
                break;
            }
            case 1:{
                cell.imgW.constant = 20;
                cell.imgH.constant = 22;
                break;
            }
            case 2:{
                cell.imgW.constant = 22;
                cell.imgH.constant = 19;
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:{
                cell.imgW.constant = 20;
                cell.imgH.constant = 20;
                break;
            }
            default:
                break;
        }

    }
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
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                MyOrderCtrl *vc = [[MyOrderCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 1:{
                KaoTiCtrl *vc = [[KaoTiCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                YHJCtrl *vc = [[YHJCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 1:{
                QBCtrl *vc = [[QBCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 2:{
                KFCtrl *vc = [[KFCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:{
                SetCtrl *vc = [[SetCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    }
}





@end
