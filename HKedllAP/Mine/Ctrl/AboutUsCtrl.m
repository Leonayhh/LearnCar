//
//  AboutUsCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "AboutUsCtrl.h"

@interface AboutUsCtrl ()

@end

@implementation AboutUsCtrl
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"关于我们";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
