//
//  AddressCtrl.m
//  LearnCar
//
//  Created by 进超王 on 17/1/17.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "AddressCtrl.h"

@interface AddressCtrl ()

@end

@implementation AddressCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    self.navigationItem.title = @"填写地址";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.textVB = [[VBTextView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, 100) placeHolder:@"请输入您的地址"];
    [self.view addSubview:self.textVB];
}
-(void)rightClick {
    
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
