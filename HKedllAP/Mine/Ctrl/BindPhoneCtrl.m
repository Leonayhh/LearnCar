//
//  BindPhoneCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "BindPhoneCtrl.h"

@interface BindPhoneCtrl ()

@end

@implementation BindPhoneCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"绑定手机";
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    
    self.bindBtn.layer.cornerRadius = 5;
    self.bindBtn.backgroundColor = RGBA(109, 203, 233, 1);
}

- (IBAction)bingClick:(id)sender {
}


- (IBAction)getcode:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
