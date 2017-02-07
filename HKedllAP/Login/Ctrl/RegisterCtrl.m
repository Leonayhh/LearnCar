//
//  RegisterCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/12.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "RegisterCtrl.h"

@interface RegisterCtrl ()

@end

@implementation RegisterCtrl

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
    
    self.view3.layer.borderWidth = 1;
    self.view3.layer.cornerRadius = 5;
    self.view3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.view3.layer.masksToBounds = YES;
    
    self.confirmBtn.layer.cornerRadius = 5;
    self.confirmBtn.layer.masksToBounds = YES;
    self.confirmBtn.backgroundColor = RGBA(109, 203, 234, 1);
    
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = RGBA(240, 240, 240, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//获取验证码
- (IBAction)getVerBtn:(id)sender {

}

//密码眼
- (IBAction)eyeBtn:(id)sender {

}

//协议
- (IBAction)cieyiBtn:(id)sender {
   
}

//协议web
- (IBAction)xieyiWebBtn:(id)sender {
    UserProcaleCtrl *vc = [[UserProcaleCtrl alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//确定
- (IBAction)confirmBtn:(id)sender {

}


@end
