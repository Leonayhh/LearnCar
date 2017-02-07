//
//  ChangeNameCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "ChangeNameCtrl.h"

@interface ChangeNameCtrl ()

@end

@implementation ChangeNameCtrl


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.navigationItem.title = @"修改昵称";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)rightClick {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
