//
//  LoginCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/10.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "LoginCtrl.h"

@interface LoginCtrl ()

@end

@implementation LoginCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view1.layer.borderWidth = 1;
    self.view1.layer.cornerRadius = 5;
    self.view1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.view1.layer.masksToBounds = YES;
    
    self.view2.layer.borderWidth = 1;
    self.view2.layer.cornerRadius = 5;
    self.view2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.view2.layer.masksToBounds = YES;
    
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.backgroundColor = RGBA(109, 203, 234, 1);

    self.navigationItem.title = @"登陆";
    self.view.backgroundColor = RGBA(240, 240, 240, 1);
    self.backView.backgroundColor = RGBA(240, 240, 240, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//登陆
- (IBAction)login:(id)sender {
    
    if ([self.loginDelegate respondsToSelector:@selector(loginToRoot)]) {
        [self.loginDelegate loginToRoot];
    }
}
//忘记密码
- (IBAction)forgetPsdBtn:(id)sender {
    FindPassWordCtrl *vc = [[FindPassWordCtrl alloc] initWithNibName:@"FindPassWordCtrl" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

//注册
- (IBAction)registerBtn:(id)sender {
    RegisterCtrl *vc = [[RegisterCtrl alloc] initWithNibName:@"RegisterCtrl" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

//qq登陆
- (IBAction)qqLoginBtn:(id)sender {
    ThreeLoginWithPhoneCtrl *vc = [[ThreeLoginWithPhoneCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//微信登陆
- (IBAction)weixinBtn:(id)sender {
    ThreeLoginWithPhoneCtrl *vc = [[ThreeLoginWithPhoneCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}





@end
