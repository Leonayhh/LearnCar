//
//  HomeCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/10.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HomeCtrl.h"

@interface HomeCtrl ()

@end

@implementation HomeCtrl

- (NSMutableArray *)imgsDataArr {
    if (!_imgsDataArr) {
        _imgsDataArr = [NSMutableArray array];
    }
    return _imgsDataArr;
}

- (NSMutableArray *)newsDataArr {
    if (!_newsDataArr) {
        _newsDataArr = [NSMutableArray array];
    }
    return _newsDataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64 - 49) style:UITableViewStyleGrouped];
    self.mTableView.backgroundColor = RGBA(237, 237, 237, 1);
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    [self.view addSubview:self.mTableView];
    
    //创建轮播图
    [self creatcycle];
    
    // 创建消息按钮
    self.msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.msgBtn.frame = CGRectMake(kScreenW - 40, 20, 20, 20);
    [self.msgBtn setImage:[UIImage imageNamed:@"msg1"] forState:UIControlStateNormal];
    [self.msgBtn setImage:[UIImage imageNamed:@"msg1"] forState:UIControlStateHighlighted];
    self.msgBtn.badgeValue = @"3";
    self.msgBtn.badgeMinSize = 0.7;
    [self.msgBtn addTarget:self action:@selector(mesBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:self.msgBtn];
    self.navigationItem.rightBarButtonItem = right;
    
    self.diTuBtn = [YLButton buttonWithType:UIButtonTypeCustom];
    [self.diTuBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.diTuBtn setTitle:@"上海" forState:UIControlStateNormal];
    self.diTuBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.diTuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.diTuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.diTuBtn addTarget:self action:@selector(diTuChoice) forControlEvents:UIControlEventTouchUpInside];
    self.diTuBtn.titleRect = CGRectMake(0, 0, 40, 20);
    self.diTuBtn.imageRect = CGRectMake(40, 10, 20, 10);
    self.diTuBtn.frame = CGRectMake(0, 0, 60, 20);
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:self.diTuBtn];
    self.navigationItem.leftBarButtonItem = left;
}

- (void) mesBtnClick {
    NSLog(@"点击了首页的消息按钮");
}

- (void)diTuChoice {
    AddressPickerDemo *vc = [[AddressPickerDemo alloc] init];
    HKBaseNavigationController *navc = [[HKBaseNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navc animated:YES completion:nil];
}



- (void) creatcycle {
    [self.imgsDataArr addObject:@"1.jpg"];
    [self.imgsDataArr addObject:@"2.jpg"];
    self.lcoalBannerView = [STBannerView bannerView];
    self.lcoalBannerView.frame = CGRectMake(0, 0, kScreenW, 120);
    self.lcoalBannerView.delegate = self;
    self.lcoalBannerView.interval = 2;
    [self.lcoalBannerView creatTimer];
    self.lcoalBannerView.hidden = NO;
    self.lcoalBannerView.images = [self.imgsDataArr mutableCopy];
    self.mTableView.tableHeaderView = self.lcoalBannerView;
}

#pragma mark - delegate

- (void)bannerView:(STBannerView *)view didSelectImageView:(UIImageView *)imageView{
    
    NSLog(@"点击：%ld",(long)imageView.tag);
    
}


#pragma mark  UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 6;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.titleLB.text = @"好消息其实我也不知道是啥";
    cell.typeLB.text = @"你猜";
    cell.dateLB.text = @"2016-05-04";
    cell.typeLB.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 120;
    } else if (section == 1) {
        return 10;
    } else if (section == 2) {
        return 50;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        self.typeView = [[TypeView alloc] init];
        self.typeView.TypeViewDelegate = self;
        return self.typeView;
    } else if (section == 1) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = RGBA(237, 237, 237, 1);
        return view;
    }
    self.newsSecView = [[[NSBundle mainBundle] loadNibNamed:@"NewsView" owner:nil options:nil] lastObject];
    return self.newsSecView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark  TypeViewDelegate
- (void)btnClickWithYLButton:(YLButton *)btn {
    if (btn == self.typeView.learnCarBtn) {
        NSLog(@"学车啦");
    } else if (btn == self.typeView.orderDrivingBtn) {
        NSLog(@"预约啦");
    } else if (btn == self.typeView.maintainBtn) {
        NSLog(@"维修啦");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
