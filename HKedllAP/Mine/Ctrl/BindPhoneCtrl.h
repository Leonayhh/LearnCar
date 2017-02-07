//
//  BindPhoneCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HKAppVC.h"

@interface BindPhoneCtrl : HKAppVC

@property (strong, nonatomic) IBOutlet UITextField *phoneTF;

@property (strong, nonatomic) IBOutlet UITextField *verCodeTF;


@property (strong, nonatomic) IBOutlet UIButton *getCodeBtn;

@property (strong, nonatomic) IBOutlet UIButton *bindBtn;


@end
