//
//  HKAppVC.m
//  GangQinEJia
//
//  Created by ly on 15/11/19.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "HKAppVC.h"

@interface HKAppVC ()

@end

@implementation HKAppVC

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isNeedNetRequest = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.isNeedNetRequest = NO;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedNetRequest = YES;
}


-(BOOL)needCheckLogin{
    NSMutableDictionary *LocDat=[FileManager LoadLocData:DB_UserConfig];
    if(!LocDat[@"userinf"]){//未登录
        //跳转登录
        [appDelegate.mainCtrl startLoadOtherCtrl];
        return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)dealloc{
    NSLog(@"%@dealloc",[self description]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
