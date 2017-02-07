//
//  TiXianCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "TiXianCtrl.h"

@interface TiXianCtrl ()

@end

@implementation TiXianCtrl

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"提现";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.TixianBtn.backgroundColor = RGBA(109, 203, 234, 1);
    self.TixianBtn.layer.cornerRadius = 5;
    self.TixianBtn.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)allbtn:(id)sender {
    
}

- (IBAction)tiXianBtn:(id)sender {
    
}

@end
