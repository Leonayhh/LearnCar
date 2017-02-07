//
//  ChongZhiCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "ChongZhiCtrl.h"

@interface ChongZhiCtrl ()

@end

@implementation ChongZhiCtrl

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"充值";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.TiXianBtn.backgroundColor = RGBA(109, 203, 234, 1);
    self.TiXianBtn.layer.cornerRadius = 5;
    self.TiXianBtn.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tixian:(id)sender {
    
}

@end
