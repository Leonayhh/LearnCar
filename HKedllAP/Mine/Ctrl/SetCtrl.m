//
//  SetCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "SetCtrl.h"

@interface SetCtrl ()

@end

@implementation SetCtrl
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"设置";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (NSArray *)cellArr {
    if (!_cellArr) {
        NSArray *one = [NSArray arrayWithObjects:@"修改密码",@"意见反馈", nil];
        NSArray *two = [NSArray arrayWithObjects:@"关于我们",@"清除缓存", nil];
        _cellArr = [NSArray arrayWithObjects:one,two,nil];
    }
    return _cellArr;
}

- (NSArray *)imgsArr {
    if (!_cellArr) {
        NSArray *one = [NSArray arrayWithObjects:@"Pas",@"Feed", nil];
        NSArray *two = [NSArray arrayWithObjects:@"aboutUs",@"Feed", nil];
        _imgsArr = [NSArray arrayWithObjects:one,two,nil];
    }
    return _imgsArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 196) style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.scrollEnabled = NO;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"SetCell" bundle:nil] forCellReuseIdentifier:@"SetCell"];
    [self.view addSubview:self.mTableView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = RGBA(109, 203, 233, 1);
    btn.frame = CGRectMake(20, 250, self.view.width - 40, 50);
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.view addSubview:btn];
   
}

- (void)btnclick {
    
}

#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.imgsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SetCell" forIndexPath:indexPath];
    cell.typeLB.text = self.cellArr[indexPath.section][indexPath.row];
    cell.imgView.image = [UIImage imageNamed:self.imgsArr[indexPath.section][indexPath.row]];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                cell.imgViewW.constant = 15;
                cell.imgViewH.constant = 20;
                break;
            }
            case 1:{
                cell.imgViewW.constant = 20;
                cell.imgViewH.constant = 20;
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                cell.imgViewW.constant = 20;
                cell.imgViewH.constant = 20;
                break;
            }
            case 1:{
                cell.imgViewW.constant = 20;
                cell.imgViewH.constant = 20;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                ChangePwdCtrl *vc = [[ChangePwdCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 1:{
                FeedCtrl *vc = [[FeedCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                AboutUsCtrl *vc = [[AboutUsCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    }
}



@end
