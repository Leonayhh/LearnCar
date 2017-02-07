//
//  LoginCtrl.h
//  LearnCar
//
//  Created by 进超王 on 17/1/10.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "RegisterCtrl.h"
#import "FindPassWordCtrl.h"
#import "ThreeLoginWithPhoneCtrl.h"


@protocol LoginCtrlDelegate <NSObject>
@optional

-(void)loginToRoot;

@end

@interface LoginCtrl : HKAppVC

@property (strong, nonatomic) IBOutlet UIImageView *headerImgview;

@property (strong, nonatomic) IBOutlet UITextField *accountTF;

@property (strong, nonatomic) IBOutlet UITextField *pwdTF;

@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@property (strong, nonatomic) IBOutlet UIView *view1;

@property (strong, nonatomic) IBOutlet UIView *view2;

@property (nonatomic, weak) id<LoginCtrlDelegate,UINavigationControllerDelegate> loginDelegate;

@property (strong, nonatomic) IBOutlet UIView *backView;

@end
