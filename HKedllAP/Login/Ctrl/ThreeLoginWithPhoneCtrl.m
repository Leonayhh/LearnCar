//
//  ThreeLoginWithPhoneCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/12.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "ThreeLoginWithPhoneCtrl.h"

@interface ThreeLoginWithPhoneCtrl ()

@end

@implementation ThreeLoginWithPhoneCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.conBtn.layer.cornerRadius = 5;
    self.view.backgroundColor = RGBA(240, 240, 240, 1);
    self.navigationItem.title = @"绑定手机";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//获取验证码
- (IBAction)getVer:(id)sender {
}

//确认绑定
- (IBAction)confirm:(id)sender {
}


@end
