//
//  HomeCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/10.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"
#import "HomeCell.h"
#import "NewsView.h"
#import "TypeView.h"
#import "STBannerView.h"
#import "YLButton.h"
#import "AddressPickerDemo.h"

@interface HomeCtrl : HKAppVC<UITableViewDelegate,UITableViewDataSource,STBannerViewDelegate,TypeViewDelegate>

@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) NSMutableArray *imgsDataArr;

@property (nonatomic, strong) NSMutableArray *newsDataArr;

@property (nonatomic, strong) NewsView *newsSecView;

@property (nonatomic, strong) TypeView *typeView;

@property (nonatomic,strong) STBannerView *lcoalBannerView;

@property (nonatomic,strong) UIButton *msgBtn;

@property (nonatomic, strong) YLButton *diTuBtn;

@end
