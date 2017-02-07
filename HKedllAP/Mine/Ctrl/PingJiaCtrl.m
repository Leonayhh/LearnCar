//
//  PingJiaCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/19.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "PingJiaCtrl.h"

@interface PingJiaCtrl ()

@end

@implementation PingJiaCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价";
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreenW, 60)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 25)];
    lable.centerY = view.centerY;
    lable.text = @"评价星级";
    lable.textColor = [UIColor lightGrayColor];
    [self.view addSubview:lable];;
    
    self.starView = [[LCStarRatingView alloc] init];
    self.starView.frame = CGRectMake(130,0, 150, 60);
    self.starView.centerY = view.centerY;
    self.starView.type = LCStarRatingViewCountingTypeHalfCutting;
    self.starView.starColor = RGBA(231, 81, 39, 1);
    [self.view addSubview:self.starView];
    
    __weak typeof(self) weakSelf = self;
    self.starView.progressDidChangedByUser = ^(CGFloat progress){
        
    };
    
    self.vbTextview = [[VBTextView alloc] initWithFrame:CGRectMake(0, view.bottom + 10, kScreenW, 120) placeHolder:@"请输入评价内容"];
    self.vbTextview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.vbTextview];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
