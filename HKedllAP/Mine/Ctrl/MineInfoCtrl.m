//
//  MineInfoCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "MineInfoCtrl.h"

@interface MineInfoCtrl ()

@end

@implementation MineInfoCtrl
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"个人信息";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (NSArray *)cellArr {
    if (!_cellArr) {
        NSArray *one = [NSArray arrayWithObjects:@"头像", nil];
        NSArray *two = [NSArray arrayWithObjects:@"昵称",@"绑定手机号",@"真实姓名",@"地址", nil];
        _cellArr = [NSArray arrayWithObjects:one,two,nil];
    }
    return _cellArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 256) style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.scrollEnabled = NO;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"MineInfoOneCell" bundle:nil] forCellReuseIdentifier:@"MineInfoOneCell"];
    [self.mTableView registerNib:[UINib nibWithNibName:@"MineInfoCell" bundle:nil] forCellReuseIdentifier:@"MineInfoCell"];
    [self.view addSubview:self.mTableView];
}


#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 ) {
        return 60;
    }
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MineInfoOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineInfoOneCell" forIndexPath:indexPath];
        return cell;
    }
    MineInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineInfoCell" forIndexPath:indexPath];
    cell.typeLB.text = self.cellArr[indexPath.section][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0: {
                ChangeNameCtrl *vc = [[ChangeNameCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 1: {
                BindPhoneCtrl *vc = [[BindPhoneCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 2: {
                ReallyNamrCtrl *vc = [[ReallyNamrCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 3: {
                AddressCtrl *vc = [[AddressCtrl alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
