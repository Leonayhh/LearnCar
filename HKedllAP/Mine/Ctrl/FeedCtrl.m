//
//  FeedCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "FeedCtrl.h"

@interface FeedCtrl ()

@end

@implementation FeedCtrl
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"意见反馈";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.textV = [[VBTextView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, 150) placeHolder:@"请输入反馈意见"];
    [self.view addSubview:self.textV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
